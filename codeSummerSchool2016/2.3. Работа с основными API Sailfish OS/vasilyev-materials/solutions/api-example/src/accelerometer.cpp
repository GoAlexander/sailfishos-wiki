#include "accelerometer.h"


Accelerometer::Accelerometer(QObject *parent) :
    QAccelerometer(parent) {
    QObject::connect(this, &QAccelerometer::readingChanged, this, &Accelerometer::valuesChanged);
}


qreal Accelerometer::x() const {
    if (QAccelerometerReading *reading = this->reading()) return reading->x();
    return qQNaN();
}


qreal Accelerometer::y() const {
    if (QAccelerometerReading *reading = this->reading()) return reading->y();
    return qQNaN();
}


qreal Accelerometer::z() const {
    if (QAccelerometerReading *reading = this->reading()) return reading->z();
    return qQNaN();
}
