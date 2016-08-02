import QtQuick 2.2
import Sailfish.Silica 1.0
import QtMultimedia 5.0

ApplicationWindow {
    initialPage: Component {
        Page {
            SilicaListView {
                VerticalScrollDecorator { flickable: parent }

                header: PageHeader { title: qsTr("Main Page") }
                anchors.fill: parent
                delegate: ListItem {
                    Label {
                        anchors.verticalCenter: parent.verticalCenter
                        x: Theme.horizontalPageMargin
                        color: highlighted ? Theme.highlightColor : Theme.primaryColor
                        text: model.name
                    }
                    onClicked: pageStack.push(Qt.resolvedUrl("pages/%1/%2.qml".arg(model.category).arg(model.page)))
                }
                section {
                    property: "category"
                    criteria: ViewSection.FullString
                    delegate: SectionHeader { text: "Qt += " + section }
                }
                model: ListModel {
                    ListElement {
                        name: "Declarative Accelerometer"
                        page: "AccelerometerDeclarativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Native Accelerometer"
                        page: "AccelerometerNativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Declarative Gyroscope"
                        page: "GyroscopeDeclarativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Declarative Light Sensors"
                        page: "LightSensorsDeclarativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Declarative Proximity Sensors"
                        page: "ProximitySensorsDeclarativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Declarative Magnetometer"
                        page: "MagnetometerDeclarativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Declarative Compass"
                        page: "CompassDeclarativePage"
                        category: "sensors"
                    }
                    ListElement {
                        name: "Native Audio Recorder"
                        page: "AudioRecorderNativePage"
                        category: "multimedia"
                    }
                    ListElement {
                        name: "DeclarativePage Audio"
                        page: "AudioDeclarativePage"
                        category: "multimedia"
                    }
                    ListElement {
                        name: "Declarative Media Player"
                        page: "MediaPlayerDeclarativePage"
                        category: "multimedia"
                    }
                    ListElement {
                        name: "Declarative Camera"
                        page: "CameraDeclarativePage"
                        category: "multimedia"
                    }
                    ListElement {
                        name: "Declarative Positioning"
                        page: "PositioningDeclarativePage"
                        category: "positioning"
                    }
                    ListElement {
                        name: "Native Positioning"
                        page: "PositioningNativePage"
                        category: "positioning"
                    }
                }
            }
        }
    }
//    cover: Component { CoverBackground { } }
    allowedOrientations: Orientation.Portrait
//    _defaultPageOrientations: Orientation.Portrait
}
