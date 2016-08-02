import QtQuick 2.2
import Sailfish.Silica 1.0
// .pro: QT += sensors
// .yaml: Requires: - qt5-qtdeclarative-import-sensors
import QtSensors 5.2
import "../.."

Page {
    Magnetometer { id: magnetometer }
    Column {
        PageHeader { title: qsTr("Declarative Magnetometer") }
        Label {
            text: qsTr("Magnetometer is busy")
            visible: magnetometer.busy
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Column {
            IconTextSwitch {
                text: "Return geo values"
                anchors.horizontalCenter: parent.horizontalCenter
                enabled: !magnetometer.active
                checked: magnetometer.returnGeoValues
                onCheckedChanged: magnetometer.returnGeoValues = checked
            }
            Button {
                text: magnetometer.active ? qsTr("Stop magnetometer") : qsTr("Start magnetometer")
                anchors.horizontalCenter: parent.horizontalCenter
                preferredWidth: Theme.buttonWidthLarge
                onClicked: magnetometer.active ? magnetometer.stop() : magnetometer.start()
            }
            ReadingValue {
                label: qsTr("X")
                width: parent.width
                source: magnetometer
                value: "x"
            }
            ReadingValue {
                label: qsTr("Y")
                width: parent.width
                source: magnetometer
                value: "y"
            }
            ReadingValue {
                label: qsTr("Z")
                width: parent.width
                source: magnetometer
                value: "z"
            }
            ReadingValue {
                label: qsTr("Calibration level")
                width: parent.width
                source: magnetometer
                value: "calibrationLevel"
            }

            visible: !magnetometer.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
