import QtQuick 2.2
import Sailfish.Silica 1.0
import "pages"
import "cover"

ApplicationWindow {
    id: applicationWindow

    allowedOrientations: Orientation.All
    initialPage: Component { Page { } }
//    initialPage: Component { FlickablePage { } }
//    initialPage: Component { StackPage { } }
//    initialPage: Component { ListPage { } }
//    initialPage: Component { MainPage { } }
    cover: Component { CoverBackground { } }
//    cover: CoverPage { }

//    property string currentPageName: "Main"

//    Connections {
//        target: pageStack
//        onDepthChanged: if ( pageStack.depth == 1) applicationWindow.currentPageName = "Main"
//    }
}
