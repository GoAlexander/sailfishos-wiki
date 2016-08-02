#ifndef ACCELEROMETER_H
#define ACCELEROMETER_H

// .pro: QT += sensors
// .yaml: Requires: - qt5-qtsensors
#include <QAccelerometer>

class Accelerometer : public QAccelerometer {
    Q_OBJECT
    Q_PROPERTY(qreal x READ x NOTIFY valuesChanged)
    Q_PROPERTY(qreal y READ y NOTIFY valuesChanged)
    Q_PROPERTY(qreal z READ z NOTIFY valuesChanged)

public:
    explicit Accelerometer(QObject *parent = 0);
    qreal x() const;
    qreal y() const;
    qreal z() const;

signals:
    void valuesChanged();
};

#endif // ACCELEROMETER_H
