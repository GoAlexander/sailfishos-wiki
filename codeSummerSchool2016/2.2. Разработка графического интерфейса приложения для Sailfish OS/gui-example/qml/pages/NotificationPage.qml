import QtQuick 2.2
import Sailfish.Silica 1.0
import org.nemomobile.notifications 1.0

Page {
    Column {
        width: parent.width
        spacing: Theme.paddingLarge

        PageHeader { title: qsTr("Notification Page") }
        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            Notification {
                id: notification
                category: "x-nemo.example"
                summary: qsTr("Notification summary")
                body: qsTr("Notification body")
//                appName: qsTr("GUI Example")
//                appIcon: "image://theme/icon-lock-information"
//                previewSummary: qsTr("Notification preview summary")
//                previewBody: qsTr("Notification preview body")
//                itemCount: 5
//                onClicked: console.log("Clicked")
//                onClosed: console.log("Closed, reason: " + reason)
            }
            text: qsTr("Application notification") +
                  (notification.replacesId ? " ID:" + notification.replacesId : "")
            onClicked: notification.publish()
        }
    }
}
