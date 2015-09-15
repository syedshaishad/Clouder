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

import bb.cascades 1.4
import bb.system 1.2
import bb.platform 1.3
TabbedPane {
    showTabsOnActionBar: true
    attachedObjects: [
        SceneCover {
            id: activeFrame
            content: ImageView {
                imageSource: "asset:///ico/q10.jpg"
                scalingMethod: ScalingMethod.AspectFill
                loadEffect: ImageViewLoadEffect.FadeZoom

            }
        }
    ]
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            title: "About"
            attachedObjects: [
                Sheet {
                    id: about
                    Page {
                        titleBar: CustomBar {
                            barTitle: "About"
                        }
                        //todo custom bar
                        ScrollView {
                            scrollViewProperties.scrollMode: ScrollMode.Vertical
                            verticalAlignment: VerticalAlignment.Fill
                            horizontalAlignment: HorizontalAlignment.Fill
                            Container {
                                layout: StackLayout {
                                    orientation: LayoutOrientation.TopToBottom
                                
                                }
                                verticalAlignment: VerticalAlignment.Fill
                                horizontalAlignment: HorizontalAlignment.Fill
                                ImageView {
                                    scalingMethod: ScalingMethod.AspectFit
                                    horizontalAlignment: HorizontalAlignment.Center
                                    imageSource: "asset:///icon%20for%20clouder.png"
                                
                                }
                                Label {
                                    text: "Version 0.0.1"
                                    horizontalAlignment: HorizontalAlignment.Center
                                    verticalAlignment: VerticalAlignment.Top
                                    textStyle.color: Color.create("#ff00baff")
                                    textFormat: TextFormat.Auto
                                    textStyle.textAlign: TextAlign.Center
                                
                                }
                                Header {
                                    title: "About"
                                    subtitle: "Details"
                                
                                }
                                TextArea {
                                    editable: false
                                    text: qsTr("Clouder is the native BlackBerry 10 App for the Official uses of \"DropBox\" and \"JustCloud\". This App is capabel for your personal use, data storage and more as you want to use. Any issues with the Dropbox please goto dropbox.com/help and some issues with JustCloud goto support.justcloud.com\r\nFacing any Bug Please contact me at \r\nbbdevshaishad@gmail.com")
                                    textFormat: TextFormat.Auto
                                    textStyle.textAlign: TextAlign.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                    scrollMode: TextAreaScrollMode.Elastic
                                
                                }
                                Header {
                                    title: "Follow me"
                                
                                }
                                StandardListItem {
                                    title: "Twitter"
                                    description: "Follow me on the Twitter"
                                    status: "Click to go"
                                    textFormat: TextFormat.Auto
                                    imageSpaceReserved: true
                                    attachedObjects: [
                                        Invocation {
                                            id: twitter
                                            query: InvokeQuery {
                                                uri: "http://twitter.com/syedshaishad"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        twitter.trigger("bb.action.OPEN")
                                    }
                                    imageSource: "asset:///twitter.png"
                                
                                }
                                StandardListItem {
                                    title: "Instagram"
                                    description: "Follow me on the Instagram"
                                    imageSource: "asset:///instagramIcon_400x400.png"
                                    status: "Click to go"
                                    attachedObjects: [
                                        Invocation {
                                            id: instagram
                                            query: InvokeQuery {
                                                uri: "http://instagram.com/syedshaishad"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        instagram.trigger("bb.action.OPEN")
                                    }
                                
                                }
                                StandardListItem {
                                    title: "Facebook"
                                    description: "Follow me on Facebook"
                                    imageSource: "asset:///facebook-icon.png"
                                    status: "Click to go"
                                    imageSpaceReserved: true
                                    attachedObjects: [
                                        Invocation {
                                            id: facebook
                                            query: InvokeQuery {
                                                uri: "http://facebook.com/syed.shaishad09"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        facebook.trigger("bb.action.OPEN")
                                    }
                                
                                }
                                Header {
                                    title: "More Popular Apps"
                                    subtitle: "by Shaishad"
                                
                                }
                                
                                StandardListItem {
                                    title: "Social Circle Pro"
                                    description: "All Social Networking at Once"
                                    status: "Download"
                                    imageSource: "asset:///User-Group-256.png"
                                    imageSpaceReserved: true
                                    attachedObjects: [
                                        Invocation {
                                            id: socialCirclePro
                                            query: InvokeQuery {
                                                uri: "appworld://content/59963953"
                                                mimeType: "app/appworld"
                                                invokeTargetId: "sys.appworld"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        socialCirclePro.trigger("bb.action.OPEN")
                                    }
                                
                                }
                                StandardListItem {
                                    title: "All Translate"
                                    description: "All in one Translator for Blackberry"
                                    status: "Download"
                                    imageSpaceReserved: true
                                    imageSource: "asset:///icon.jpg"
                                    attachedObjects: [
                                        Invocation {
                                            id: allTranslate
                                            query: InvokeQuery {
                                                uri: "appworld://content/59962667"
                                                mimeType: "app/appworld"
                                                invokeTargetId: "sys.appworld"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        allTranslate.trigger("bb.action.OPEN")
                                    }
                                
                                }
                                StandardListItem {
                                    
                                    attachedObjects: [
                                        Invocation {
                                            id: invisbicon
                                            query: InvokeQuery {
                                                uri: "appworld://content/59963491"
                                                mimeType: "app/appworld"
                                                invokeTargetId: "sys.appworld"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        invisbicon.trigger("bb.action.OPEN")
                                    }
                                    title: "Invisibicon"
                                    description: "Create Invisible Icons on your Home screen"
                                    imageSpaceReserved: true
                                    imageSource: "asset:///awesome-info.png"
                                    status: "Download"
                                }
                                Header {
                                    title: "Special Thanks"
                                    subtitle: "Thanking Developer"
                                
                                }
                                StandardListItem {
                                    imageSource: "asset:///Tundra.png"
                                    title: "Tundra Core Studios Limited"
                                    description: "Thanks for the help to success full this app"
                                    status: "BlackBerry World"
                                    imageSpaceReserved: true
                                    attachedObjects: [
                                        Invocation {
                                            id: tundra
                                            query: InvokeQuery {
                                                uri: "appworld://vendor/64825"
                                                mimeType: "vendor/appworld"
                                                invokeTargetId: "sys.appworld"
                                            
                                            }
                                        }
                                    ]
                                    onTouch: {
                                        tundra.trigger("bb.action.OPEN")
                                    }
                                
                                }
                                Divider {
                                
                                }
                                Label {
                                    text: "© Clouder 2015. Shaishad"
                                    textStyle.textAlign: TextAlign.Center
                                    horizontalAlignment: HorizontalAlignment.Center
                                
                                }
                            
                            }
                        }
                        actions: [
                            ActionItem {
                                title: "close"
                                imageSource: "asset:///freeiconmaker_0%20(4).png"
                                ActionBar.placement: ActionBarPlacement.Signature
                                onTriggered: {
                                    about.close()
                                    
                                }
                            }
                        ]
                    }

                }
            ]
            onTriggered: {
                about.open()
            }
        }
        settingsAction: SettingsActionItem {
            title: "Options"
            attachedObjects: [
                Sheet {
                    id: settings
                    Page {
                        titleBar: CustomBar {
                            barTitle: "Options"
                        }
                        Container {
                            topPadding: 20
                            Header {
                                title: "Theme Selection"
                                subtitle: "Dark or Bright"
                       }
                            DropDown {
                                id: themeDropDown
                                title: "Theme Select"
                                Option {
                                    text: "Bright"
                                    value: VisualStyle.Bright
                                }
                                Option {
                                    text: "Dark"
                                    value: VisualStyle.Dark
                                }
                                onSelectedOptionChanged: {
                                    Settings.saveValueFor("theme", VisualStyle.Bright == themeDropDown.selectedValue ? "bright" : "dark");
                                }
                            }
                            Label {
                                text: "Restart app to save theme setting."
                                horizontalAlignment: HorizontalAlignment.Center
                            }
                            Header {
                                title: "Account"
                                subtitle: "Logout from sessions"
                            
                            }
                            Button {
                                text: "DropBox"
                                horizontalAlignment: HorizontalAlignment.Fill
                                attachedObjects: [
                                    SystemToast {
                                        id: loggedOut
                                        body: "Logged Out"
                                    }
                                ]
                                onClicked: {
                                    drop.storage.clearCookies()
                                    loggedOut.show()
                                }
                            
                            }
                            Button {
                                horizontalAlignment: HorizontalAlignment.Fill
                                text: "JustCloud"
                                onClicked: {
                                    jcloud.storage.clearCookies()
                                    loggedOut.show()
                                }
                            
                            }
                            Header {
                                title: "Cache cleaner"
                                subtitle: "Clean cache"
                            
                            }
                            Button {
                                text: "Clean"
                                attachedObjects: [
                                    SystemToast {
                                        id: cleaned
                                        body: "Cleaned"
                                    }
                                ]
                                horizontalAlignment: HorizontalAlignment.Center
                                onClicked: {
                                    drop.storage.clearCache()
                                    jcloud.storage.clearCache()
                                    cleaned.show()
                                }
                            
                            }
                        }
                        onCreationCompleted: {
                            var theme = Settings.getValueFor("theme", VisualStyle.Bright == themeDropDown.selectedValue ? "bright" : "dark");
                            themeDropDown.setSelectedIndex("bright" == theme ? 0 : 1);
                        }
                        actions: [
                            ActionItem {
                                ActionBar.placement: ActionBarPlacement.Signature
                                title: "Close"
                                imageSource: "asset:///freeiconmaker_0%20(4).png"
                                onTriggered: {
                                    settings.close()
                                    
                                }
                            
                            }
                        ]
                }
        }]
            onTriggered: {
                settings.open()
            }
        }
        actions: [
            ActionItem {
                title: "BBM Channel"
                imageSource: "asset:///ico/Tag-Cloud-128.png"
                attachedObjects: [
                    Invocation {
                        id: bbmChannel
                        query: InvokeQuery {
                            uri: "bbmc:C003AB450"
                        }
                    }
                ]
                onTriggered: {
                    bbmChannel.trigger("bb.action.OPENBBMCHANNEL")
                }
            },
            ActionItem {
                title: "More Apps"
                imageSource: "asset:///ico/Blackberry-128%20(15).png"
                attachedObjects: [
                    Invocation {
                        id: moreApps
                        query: InvokeQuery {
                            uri: "appworld://vendor/93696"
                        }
                    }
                ]
                onTriggered: {
                    moreApps.trigger("bb.action.OPEN")
                }
            },
            ActionItem {
                title: "Review"
                imageSource: "asset:///ico/Thumbs-Up-128.png"
                attachedObjects: [
                    Invocation {
                        id: review
                        query: InvokeQuery {
                            uri: "appworld://content/59967977"
                        }
                    }
                ]
                onTriggered: {
                    review.trigger("bb.action.OPEN")
                }
            }
        ]
    }
  Tab {
        title: "Dropbox"

        imageSource: "asset:///storage27.png"
        Page {
   
    Container {
                layout: DockLayout {

                }
                
                ActivityIndicator {
                    id: actIn
                    running: true
                    visible: false
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    preferredWidth: 200.0
                    preferredHeight: 200.0

                }
      ScrollView {
                    scrollViewProperties.scrollMode: ScrollMode.Vertical
                    WebView {
                        id: drop
                        url: "http://dropbox.com"
                        onLoadingChanged: {
                            if (loadRequest.status == WebLoadStatus.Started){
                                actIn.visible = true
                            }else if (loadRequest.status == WebLoadStatus.Succeeded)
                            {
                                actIn.visible = false
                            }
                        }

                    }

                }
    }
    actions: [
        ActionItem {
                    title: "Back"
                    onTriggered: {
                        drop.goBack()
                    }
                    imageSource: "asset:///ico/Back_button_128.png"

                },
        ActionItem {
                    title: "Reload"
                    onTriggered: {
                        drop.reload()
                    }
                    imageSource: "asset:///ico/Clockwise.png"

                },
        ActionItem {
                    title: "Forward"
                    onTriggered: {
                        drop.goForward()
                    }
                    imageSource: "asset:///ico/Right_128.png"

                },
        ActionItem {
                    title: "Share BBM"
                    attachedObjects: [
                        Invocation {
                            id: shareBBM
                            query: InvokeQuery {
                                invokeTargetId: "sys.bbm.sharehandler"
                                mimeType: "text/plain"
                                data: "Hey Want a Clouding tool for Dropbox and JustCloud. Just Follow the Link blck.by/1U0YTeqr it's called as Clouder. Shaishad Apps"

                            }
                        }
                    ]
                    onTriggered: {
                        shareBBM.trigger("bb.action.SHARE")
                    }
                    imageSource: "asset:///ico/Tag-Cloud-128.png"

                },
        ActionItem {
                    title: "BBM Status"
                    attachedObjects: [
                        TextArea {
                            id: text
                            text: "I'm using Clouder for Cloud storages from Shaishad Apps http://blck.by/1U0YTeq Download Now"

                        }
                    ]
                    onTriggered: {
                        _app.updatePersonalMessage(text.text)
                    }
                    ActionBar.placement: ActionBarPlacement.OnBar
                    imageSource: "asset:///ico/Pencil-128.png"

                }
    ]
}

}
    Tab {
        title: "JustCloud"
        imageSource: "asset:///justcloud.png"
        Page {
            Container {
                layout: DockLayout {
                
                }
                ActivityIndicator {
                    id: actIn3
                    running: true
                    visible: false
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    preferredWidth: 200.0
                    preferredHeight: 200.0
                
                }
                ScrollView {
                    scrollViewProperties.scrollMode: ScrollMode.Vertical
                    WebView {
                        id: jcloud
                        url: "http://justcloud.com"
                        onLoadingChanged: {
                            if (loadRequest.status == WebLoadStatus.Started){
                                actIn3.visible = true
                            }else if (loadRequest.status == WebLoadStatus.Succeeded)
                            {
                                actIn3.visible = false
                            }
                        }
                    
                    }
                
                }
            
            }
            actions: [
                ActionItem {
                    title: "Back"
                    onTriggered: {
                        jcloud.goBack()
                    }
                    imageSource: "asset:///ico/Back_button_128.png"

                },
                ActionItem {
                    title: "Reload"
                    onTriggered: {
                        jcloud.reload()
                    }
                    imageSource: "asset:///ico/Clockwise.png"

                },
                ActionItem {
                    title: "Forward"
                    onTriggered: {
                        jcloud.goForward()
                    }
                    imageSource: "asset:///ico/Right_128.png"

                },
                ActionItem {
                    title: "Share BBM"
                    onTriggered: {
                        shareBBM.trigger("bb.action.SHARE")
                    }
                    imageSource: "asset:///ico/Tag-Cloud-128.png"

                },
                ActionItem {
                    title: "BBM Status"
                    
                    onTriggered: {
                        _app.updatePersonalMessage(text.text)
                    }
                    ActionBar.placement: ActionBarPlacement.OnBar
                    imageSource: "asset:///ico/Pencil-128.png"

                }
            ]
        }
    
    }
onCreationCompleted: {
    Application.setCover(activeFrame)
}
}