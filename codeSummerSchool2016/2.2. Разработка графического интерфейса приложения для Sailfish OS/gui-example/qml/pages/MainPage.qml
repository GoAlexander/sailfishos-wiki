import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    id: mainPage
    SilicaListView {
        header: PageHeader { title: qsTr("Main Page") }
        anchors.fill: parent
        delegate: ListItem {
            Label {
                anchors.verticalCenter: parent.verticalCenter
                x: Theme.horizontalPageMargin
                color: highlighted ? Theme.highlightColor : Theme.primaryColor
                text: model.name
            }
            onClicked: {
                pageStack.push(Qt.resolvedUrl(model.page + ".qml"));
//                applicationWindow.currentPageName = model.name
            }
        }
        section {
            property: "category"
            criteria: ViewSection.FullString
            delegate: SectionHeader { text: section }
        }
        model: ListModel {
            ListElement {
                name: "PageStack"
                page: "StackPage"
                category: "Stack"
            }
            ListElement {
                name: "SilicaFlickable"
                page: "FlickablePage"
                category: "Views"
            }
            ListElement {
                name: "SilicaListView"
                page: "ListPage"
                category: "Views"
            }
//            ListElement {
//                name: "SilicaGridView"
//                page: "GridPage"
//                category: "Views"
//            }
//            ListElement {
//                name: "SlideshowView"
//                page: "SlideshowPage"
//                category: "Views"
//            }
//            ListElement {
//                name: "SilicaWebView"
//                page: "WebViewPage"
//                category: "Views"
//            }
//            ListElement {
//                name: "Text Input"
//                page: "TextInputPage"
//                category: "Input"
//            }
//            ListElement {
//                name: "PullDownMenu"
//                page: "PullDownMenuPage"
//                category: "Menus"
//            }
//            ListElement {
//                name: "PushUpMenu"
//                page: "PushUpMenuPage"
//                category: "Menus"
//            }
//            ListElement {
//                name: "ContextMenu"
//                page: "ContextMenuPage"
//                category: "Menus"
//            }
//            ListElement {
//                name: "Dialog"
//                page: "DialogPage"
//                category: "Dialogs"
//            }
//            ListElement {
//                name: "Notification"
//                page: "NotificationPage"
//                category: "Notifications"
//            }
        }
        VerticalScrollDecorator { }
    }
}
