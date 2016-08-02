import QtQuick 2.2
import Sailfish.Silica 1.0
import ru.omprussia.example.api 1.0
import "../.."

Page {
    Accelerometer { id: accelerometer }
    Column {
        PageHeader { title: qsTr("Native Accelerometer") }
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
                text: isNaN(accelerometer.x) ? " " : accelerometer.x
            }
            ReadingValue {
                label: qsTr("Y")
                width: parent.width
                source: accelerometer
                text: isNaN(accelerometer.y) ? " " : accelerometer.y
            }
            ReadingValue {
                label: qsTr("Z")
                width: parent.width
                source: accelerometer
                text: isNaN(accelerometer.z) ? " " : accelerometer.z
            }

            visible: !accelerometer.busy
            width: parent.width
            spacing: Theme.paddingLarge
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
