/*
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <bb/system/SystemDialog>
using namespace bb::cascades;
using namespace bb::system;
ApplicationUI::ApplicationUI() :
        QObject()
{
    // prepare the localization
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);

    bool res = QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()));
    // This is only available in Debug builds
    Q_ASSERT(res);
    // Since the variable is not used in the amp, this is added to avoid a
    // compiler warning
    Q_UNUSED(res);

    // initial load
    onSystemLanguageChanged();

    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("_app", this);

    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();

    // Set created root object as the application scene
    Application::instance()->setScene(root);
    m_context = new bb::platform::bbm::Context(
                //UUID was generated at random for this sample
                //BE SURE TO USE YOUR OWN UNIQUE UUID. You can grenade one here: http://www.guidgenerator.com/
                QUuid("6572670a-f4a2-4a32-b960-543bdd2b10f1"));
        if (m_context->registrationState()
                != bb::platform::bbm::RegistrationState::Allowed) {
            connect(m_context,
                    SIGNAL(registrationStateUpdated (bb::platform::bbm::RegistrationState::Type)),
                    this,
                    SLOT(registrationStateUpdated (bb::platform::bbm::RegistrationState::Type)));
            m_context->requestRegisterApplication();
        }
}
void ApplicationUI::inviteUserToDownloadViaBBM() {
    if (m_context->registrationState()
            == bb::platform::bbm::RegistrationState::Allowed) {
        m_messageService->sendDownloadInvitation();
    } else {
        SystemDialog *bbmDialog = new SystemDialog("OK");
        bbmDialog->setTitle("BBM Connection Error");
        bbmDialog->setBody(
                "BBM is not currently connected. Please setup / sign-in to BBM to remove this message.");
        connect(bbmDialog, SIGNAL(finished(bb::system::SystemUiResult::Type)),
                this, SLOT(dialogFinished(bb::system::SystemUiResult::Type)));
        bbmDialog->show();
        return;
    }
}
void ApplicationUI::updatePersonalMessage(const QString &message) {
    if (m_context->registrationState()
            == bb::platform::bbm::RegistrationState::Allowed) {
        m_userProfile->requestUpdatePersonalMessage(message);
    } else {
        SystemDialog *bbmDialog = new SystemDialog("OK");
        bbmDialog->setTitle("BBM Connection Error");
        bbmDialog->setBody(
                "BBM is not currently connected. Please setup / sign-in to BBM to remove this message.");
        connect(bbmDialog, SIGNAL(finished(bb::system::SystemUiResult::Type)),
                this, SLOT(dialogFinished(bb::system::SystemUiResult::Type)));
        bbmDialog->show();
        return;
    }
}
void ApplicationUI::registrationStateUpdated(
        bb::platform::bbm::RegistrationState::Type state) {
    if (state == bb::platform::bbm::RegistrationState::Allowed) {
        m_messageService = new bb::platform::bbm::MessageService(m_context,
                this);
        m_userProfile = new bb::platform::bbm::UserProfile(m_context, this);
    } else if (state == bb::platform::bbm::RegistrationState::Unregistered) {
        m_context->requestRegisterApplication();
    }
}
void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("Clouder_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}
