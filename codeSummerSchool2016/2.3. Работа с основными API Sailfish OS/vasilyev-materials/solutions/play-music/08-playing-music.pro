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
TARGET = 08-playing-music

CONFIG += sailfishapp

sounds.files = samples/
sounds.path = /usr/share/$${TARGET}/
INSTALLS += sounds

SOURCES += src/08-playing-music.cpp

OTHER_FILES += qml/08-playing-music.qml \
    qml/cover/CoverPage.qml \
    rpm/08-playing-music.changes.in \
    rpm/08-playing-music.spec \
    rpm/08-playing-music.yaml \
    translations/*.ts \
    08-playing-music.desktop

SAILFISHAPP_ICONS = 86x86 108x108 128x128 256x256

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
TRANSLATIONS += translations/08-playing-music-de.ts

DISTFILES += \
    qml/pages/SoundEffectPage.qml \
    qml/pages/PlayersListPage.qml \
    qml/pages/AudioPlayerPage.qml

