#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif


#include <sailfishapp.h>
#include "audiorecorder.h"
#include "accelerometer.h"
#include "positioning.h"


int main(int argc, char *argv[]) {
    qmlRegisterType<Accelerometer>("ru.omprussia.example.api", 1, 0, "Accelerometer");
    qmlRegisterType<AudioRecorder>("ru.omprussia.example.api", 1, 0, "AudioRecorder");
    qmlRegisterType<Positioning>("ru.omprussia.example.api", 1, 0, "Positioning");
    return SailfishApp::main(argc, argv);
}
