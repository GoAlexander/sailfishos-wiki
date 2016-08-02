import QtQuick 2.2
import Sailfish.Silica 1.0
import ru.omprussia.example.api 1.0

Page {
    AudioRecorder {
        id: audioRecorder
        outputLocation: "/home/nemo/api-example.wav"
    }
    Column {
        PageHeader { title: qsTr("Native Audio Recorder") }
        Row {
            Button {
                text: {
                    switch (audioRecorder.state) {
                    case AudioRecorder.StoppedState:
                        return qsTr("Record");
                    case AudioRecorder.PausedState:
                        return qsTr("Continue");
                    default:
                        return qsTr("Pause");
                    }
                }
                onClicked: {
                    switch (audioRecorder.state) {
                    case AudioRecorder.StoppedState:
                    case AudioRecorder.PausedState:
                        return audioRecorder.record();
                    default:
                        return audioRecorder.pause();
                    }
                }
            }
            Button {
                text: qsTr("Stop")
                enabled: audioRecorder.state !== AudioRecorder.StoppedState
                onClicked: audioRecorder.stop()
            }

            anchors.horizontalCenter: parent.horizontalCenter
            spacing: Theme.paddingLarge
        }
        TextField {
            label: qsTr("Duration (ms)")
            width: parent.width
            text: audioRecorder.duration
            readOnly: true
            color: Theme.highlightColor
        }

        anchors.fill: parent
        spacing: Theme.paddingLarge
    }
}
