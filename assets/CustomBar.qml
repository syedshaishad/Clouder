import bb.cascades 1.4

TitleBar {
    id: customTitleBar
    property alias barTitle: titleLabel.text
    property int layoutHeight: 0
    property int layoutWidth: 0
    
    kind: TitleBarKind.FreeForm
    
    // This is a custom title bar so we put the content (a text)
    // and an image) in a FreeFormTitleBarKindProperties.
    kindProperties: FreeFormTitleBarKindProperties {
        Container {
            leftPadding: 25
            
            background: titlePaint.imagePaint
            attachedObjects: [
                ImagePaintDefinition {
                    id: titlePaint
                    imageSource: "asset:///custom_title.png"

                },
                LayoutUpdateHandler {
                    id: layoutHandler
                    onLayoutFrameChanged: {
                        // We store the height and width of the title bar as it is layouted.
                        customTitleBar.layoutHeight = layoutFrame.height;
                        customTitleBar.layoutWidth = layoutFrame.width;
                    }
                }
            ]
            
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            
            Label {
                id: titleLabel
                verticalAlignment: VerticalAlignment.Center
                
                textStyle {
                    color: Color.White
                    base: SystemDefaults.TextStyles.TitleText
                    fontWeight: FontWeight.W500
                }
                
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }
            }
        
        }
    }
}