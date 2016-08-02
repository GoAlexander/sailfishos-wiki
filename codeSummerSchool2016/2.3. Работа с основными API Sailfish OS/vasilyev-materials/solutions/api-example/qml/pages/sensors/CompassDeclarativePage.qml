import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += sensors
// .yaml: Requires: - qt5-qtdeclarative-import-sensors
import QtSensors 5.2
import "../.."

Page {
    Compass { id: compass }
    Column {
        PageHeader { title: qsTr("Declarative Compass") }
        Label {
            text: qsTr("Compass is busy")
            visible: compass.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: compass.active ? qsTr("Stop compass") : qsTr("Start compass")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: compass.active ? compass.stop() : compass.start()
            }
            Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: Theme.horizontalPageMargin
                    rightMargin: Theme.horizontalPageMargin
                }
                height: width
                radius: 0.5 * width
                border.color: Theme.highlightColor
                color: Theme.rgba(Theme.highlightBackgroundColor, Theme.highlightBackgroundOpacity)
                Rectangle {
                    property real radianAngle: compass.reading ? compass.reading.azimuth * Math.PI / 180 : 0

                    x: (parent.radius - radius) * (1 - Math.sin(radianAngle))
                    y: (parent.radius - radius) * (1 - Math.cos(radianAngle))
                    width: 1.5 * nLabel.height
                    height: width
                    radius: 0.5 * width
                    color: Theme.secondaryColor
                    Label {
                        id: nLabel
                        text: qsTr("N")
                        anchors.centerIn: parent
                        color: Theme.highlightBackgroundColor
                    }
                }
            }
            ReadingValue {
                label: qsTr("Azimuth")
                width: parent.width
                source: compass
                value: "azimuth"
            }
            ReadingValue {
                label: qsTr("Calibration level")
                width: parent.width
                source: compass
                value: "calibrationLevel"
            }

            visible: !compass.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
