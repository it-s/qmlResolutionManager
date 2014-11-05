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
//        onResolutionChanged: console.log("Resolution changed")
    }

    //This is for testing only!!!!
    //Never do this in real app
    onWidthChanged: _S.refreshScreenScaleRatio()
    onHeightChanged: _S.refreshScreenScaleRatio()

    //--------------------------
    Rectangle {
        id: header
        height: _S.scale(48)
        color: "#00aaff"
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top

        Text {
            color: "#ffffff"
            text: "App Header"
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: _S.scale(20)
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    ListModel {
        id: colorModel

        property variant names: ["Grey", "Red", "Blue", "Green"]
        property variant clors: ["grey", "red", "blue", "green"]

        function randName() {
            return names[Math.floor(Math.random() * 4)]
        }
        function randColor() {
            return clors[Math.floor(Math.random() * 4)]
        }

        Component.onCompleted: {
            for (var i = 0; i < 100; i++) {
                colorModel.append({
                                      name: randName(),
                                      colorCode: randColor()
                                  })
            }
            gridView1.model = colorModel
        }
    }

    GridView {
        id: gridView1
        anchors.top: header.bottom
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        clip: true

        cellWidth: _S.scale(80)
        cellHeight: cellWidth

        delegate: Item {
            width: _S.scale(80)
            height: width

            Column {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: _S.scale(5)
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: _S.scale(40)
                    height: _S.scale(40)
                    color: colorCode
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: name
                    font.bold: true
                    font.pixelSize: _S.scale(14)
                }
            }
        }
    }
}
