#include "searchresultobject.h"

SearchResultObject::SearchResultObject(QObject *parent) : QObject(parent) {}

SearchResultObject::SearchResultObject(QString title, QString url) {
    _title = title;
    _url = url;
}

