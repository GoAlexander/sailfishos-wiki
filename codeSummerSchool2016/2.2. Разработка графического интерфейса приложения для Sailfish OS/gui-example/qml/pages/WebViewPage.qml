import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    Column {
        anchors.fill: parent

        SilicaWebView {
            id: webView
            width: parent.width
            height: parent.height - urlField.height
            url: "http://omprussia.ru"
        }
        TextField {
            id: urlField
            inputMethodHints: Qt.ImhUrlCharactersOnly
            text: "http://omprussia.ru"
            label: webView.title
            EnterKey.onClicked: {
                webView.url = text;
                parent.focus = true;
            }
        }
    }
}
