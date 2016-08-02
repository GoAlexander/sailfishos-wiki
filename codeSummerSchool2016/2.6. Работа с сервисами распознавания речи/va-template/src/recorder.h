#ifndef RECORDER_H
#define RECORDER_H

#include <QAudioEncoderSettings>
#include <QAudioRecorder>
#include <QMultimedia>
#include <QObject>
#include <QUrl>

#include <QDebug>

class Recorder : public QObject
{
    Q_OBJECT

public:
    explicit Recorder(QObject *parent = 0);
    ~Recorder();

    Q_INVOKABLE void startRecord();
    Q_INVOKABLE void stopRecord();
    Q_INVOKABLE QUrl getActualLocation();
    Q_INVOKABLE bool isRecording() { return _recording; }

private:
    QAudioRecorder *_audioRecorder;
    QAudioEncoderSettings _settings;
    bool _recording;
};

#endif // RECORDER_H
