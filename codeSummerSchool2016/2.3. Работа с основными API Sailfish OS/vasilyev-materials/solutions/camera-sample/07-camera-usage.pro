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
TARGET = 07-camera-usage

CONFIG += sailfishapp

SOURCES += src/07-camera-usage.cpp

OTHER_FILES += qml/07-camera-usage.qml \
    qml/cover/CoverPage.qml \
    rpm/07-camera-usage.changes.in \
    rpm/07-camera-usage.spec \
    rpm/07-camera-usage.yaml \
    translations/*.ts \
    07-camera-usage.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/07-camera-usage-de.ts

DISTFILES += \
    qml/pages/CameraViewPage.qml

