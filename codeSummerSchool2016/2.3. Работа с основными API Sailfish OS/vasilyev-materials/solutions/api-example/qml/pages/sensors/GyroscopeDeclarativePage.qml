import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += sensors
// .yaml: Requires: - qt5-qtdeclarative-import-sensors
import QtSensors 5.2
import "../.."

Page {
    Gyroscope { id: gyroscope }
    Column {
        PageHeader { title: qsTr("Declarative Gyroscope") }
        Label {
            text: qsTr("Gyroscope is busy")
            visible: gyroscope.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: gyroscope.active ? qsTr("Stop gyroscope") : qsTr("Start gyroscope")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: gyroscope.active ? gyroscope.stop() : gyroscope.start()
            }
            ReadingValue {
                label: qsTr("X")
                width: parent.width
                source: gyroscope
                value: "x"
            }
            ReadingValue {
                label: qsTr("Y")
                width: parent.width
                source: gyroscope
                value: "y"
            }
            ReadingValue {
                label: qsTr("Z")
                width: parent.width
                source: gyroscope
                value: "z"
            }

            visible: !gyroscope.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
