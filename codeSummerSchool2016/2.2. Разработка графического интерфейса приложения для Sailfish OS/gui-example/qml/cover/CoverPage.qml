import QtQuick 2.2
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        text: applicationWindow.currentPageName
    }
    CoverActionList {
        CoverAction {
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: pageStack.pop()
        }
    }
}
