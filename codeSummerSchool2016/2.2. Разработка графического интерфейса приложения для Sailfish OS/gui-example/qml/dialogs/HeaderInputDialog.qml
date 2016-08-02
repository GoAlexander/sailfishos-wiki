import QtQuick 2.2
import Sailfish.Silica 1.0

Dialog {
    property string name

    Column {
        anchors.fill: parent

        DialogHeader { }
        TextField {
            id: nameField

            width: parent.width
            placeholderText: qsTr("Enter page name")
            label: qsTr("Page name")
//            text: name
        }
    }

    onDone: if (result == DialogResult.Accepted) name = nameField.text
}
