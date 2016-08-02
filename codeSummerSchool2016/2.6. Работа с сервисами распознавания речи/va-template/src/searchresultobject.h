#ifndef SEARCHRESULTOBJECT_H
#define SEARCHRESULTOBJECT_H

#include <QObject>
#include <QString>

class SearchResultObject : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString title READ title)
    Q_PROPERTY(QString url READ url)

public:
    explicit SearchResultObject(QObject *parent = 0);
    SearchResultObject(QString title, QString url);

public slots:
    QString title() { return _title; }
    QString url() { return _url; }

private:
    QString _title;
    QString _url;
};

#endif // SEARCHRESULTOBJECT_H
