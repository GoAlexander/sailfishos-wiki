import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.fill: parent

        PageHeader { id: header }
        Button {
            text: qsTr("Set header")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                var dialog =
                    pageStack.push(Qt.resolvedUrl("../dialogs/HeaderInputDialog.qml"),
                        {"name": header.title});
                dialog.accepted.connect(function() {
                    header.title = dialog.name;
                });
            }
        }
    }
}
