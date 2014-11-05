import QtQuick 2.0
import QtQuick.Controls 1.2

ApplicationWindow {
    id: applicationWindow1
    width: 320
    height: 480

    title: "Resource Manager Test Window"

    ResolutionManager {
        id: _S
        appWindow: parent
        intendedScreenWidth: 320
        intendedScreenHeight: 480
        onResolutionChanged: console.log("Resolution changed")
    }

    //This is for testing only!!!!
    //Never do this in real app
    onWidthChanged: _S.refreshScreenScaleRatio()
    onHeightChanged: _S.refreshScreenScaleRatio()
    //--------------------------


    Rectangle {
        id: header
        height: 48
        color: "#00aaff"
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Text{
            color: "#ffffff"
            text: "App Header"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    GridView {
        id: gridView1
        anchors.topMargin: 0
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        cellWidth: 70
        delegate: Item {
            x: 5
            height: 50
            Column {
                spacing: 5
                Rectangle {
                    width: 40
                    height: 40
                    color: colorCode
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    x: 5
                    text: name
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }
        model: ListModel {
            ListElement {
                name: "Grey"
                colorCode: "grey"
            }

            ListElement {
                name: "Red"
                colorCode: "red"
            }

            ListElement {
                name: "Blue"
                colorCode: "blue"
            }

            ListElement {
                name: "Green"
                colorCode: "green"
            }
        }
        cellHeight: 70
    }

}
