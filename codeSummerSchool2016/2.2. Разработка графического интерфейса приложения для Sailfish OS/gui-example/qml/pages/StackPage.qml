import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    Column {
        width: parent.width
        spacing: Theme.paddingLarge

        PageHeader { title: qsTr("Page %1").arg(pageStack.depth) }
        Button {
            text: qsTr("Push page")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageStack.push(Qt.resolvedUrl("StackPage.qml"))
        }
        Button {
            text: qsTr("Pop page")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: pageStack.pop()
            enabled: pageStack.depth > 1
        }
//        Button {
//            text: qsTr("Attach page")
//            anchors.horizontalCenter: parent.horizontalCenter
//            onClicked: pageStack.pushAttached(Qt.resolvedUrl("StackPage.qml"))
//        }
//        Button {
//            text: qsTr("Next page")
//            anchors.horizontalCenter: parent.horizontalCenter
//            onClicked: pageStack.navigateForward()
//        }
//        Button {
//            text: qsTr("Previous page")
//            anchors.horizontalCenter: parent.horizontalCenter
//            onClicked: pageStack.navigateBack()
//        }
    }
}
