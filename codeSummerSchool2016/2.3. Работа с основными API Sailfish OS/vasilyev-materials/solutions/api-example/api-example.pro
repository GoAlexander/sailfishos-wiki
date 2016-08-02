# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = api-example

CONFIG += sailfishapp

SOURCES += \
    src/audiorecorder.cpp \
    src/positioning.cpp \
    src/accelerometer.cpp \
    src/api-example.cpp

OTHER_FILES += qml/api-example.qml \
    rpm/api-example.changes.in \
    rpm/api-example.spec \
    rpm/api-example.yaml \
    translations/*.ts \
    api-example.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/api-example-ru.ts

HEADERS += \
    src/audiorecorder.h \
    src/positioning.h \
    src/accelerometer.h


QT += \
    sensors \
    multimedia \
    positioning

DISTFILES += \
    qml/pages/sensors/AccelerometerDeclarativePage.qml \
    qml/pages/sensors/AccelerometerNativePage.qml \
    qml/pages/sensors/CompassDeclarativePage.qml \
    qml/pages/sensors/GyroscopeDeclarativePage.qml \
    qml/pages/sensors/LightSensorsDeclarativePage.qml \
    qml/pages/sensors/MagnetometerDeclarativePage.qml \
    qml/pages/sensors/ProximitySensorsDeclarativePage.qml \
    qml/pages/multimedia/AudioRecorderNativePage.qml \
    qml/pages/multimedia/CameraDeclarativePage.qml \
    qml/pages/positioning/PositioningDeclarativePage.qml \
    qml/pages/positioning/PositioningNativePage.qml \
    qml/pages/multimedia/MediaPlayerDeclarativePage.qml \
    qml/pages/multimedia/AudioDeclarativePage.qml \
    qml/ReadingValue.qml
