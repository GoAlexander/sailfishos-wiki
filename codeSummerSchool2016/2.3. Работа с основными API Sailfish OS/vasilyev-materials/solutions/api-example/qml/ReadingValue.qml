import Sailfish.Silica 1.0

TextField {
    property variant source
    property string value

    text: source.reading ? source.reading[value] : " "
    readOnly: true
    color: (source && source.active) ? Theme.highlightColor : Theme.highlightDimmerColor
}
