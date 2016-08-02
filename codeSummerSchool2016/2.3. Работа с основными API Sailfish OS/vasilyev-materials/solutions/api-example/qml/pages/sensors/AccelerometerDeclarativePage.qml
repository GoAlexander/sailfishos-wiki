import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += sensors
// .yaml: Requires: - qt5-qtdeclarative-import-sensors
import QtSensors 5.2
import "../.."

Page {
    Accelerometer { id: accelerometer }
    Column {
        PageHeader { title: qsTr("Declarative Accelerometer") }
        Label {
            text: qsTr("Accelerometer is busy")
            visible: accelerometer.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            Button {
                text: accelerometer.active ? qsTr("Stop accelerometer") : qsTr("Start accelerometer")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: accelerometer.active ? accelerometer.stop() : accelerometer.start()
            }
            ReadingValue {
                label: qsTr("X")
                width: parent.width
                source: accelerometer
                value: "x"
            }
            ReadingValue {
                label: qsTr("Y")
                width: parent.width
                source: accelerometer
                value: "y"
            }
            ReadingValue {
                label: qsTr("Z")
                width: parent.width
                source: accelerometer
                value: "z"
            }

            visible: !accelerometer.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
