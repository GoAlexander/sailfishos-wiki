#ifndef AUDIORECORDER_H
#define AUDIORECORDER_H

// .pro: QT += multimedia
// .yaml: Requires: - qt5-qtmultimedia
#include <QtMultimedia/QAudioRecorder>

class AudioRecorder : public QAudioRecorder {
    Q_OBJECT
public:
    explicit AudioRecorder(QObject *parent = 0);
};

#endif // AUDIORECORDER_H
