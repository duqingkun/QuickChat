import QtQuick 2.0

Item {
    id: root
    property alias color: search.color
    signal filter(string text)

    Rectangle{
        id: search
        anchors.fill: parent
        color: root.color

        Rectangle{
            anchors.fill: parent
            anchors.margins: 8
            color: "#ccc"
            radius: 5

            TextInput{
                id: input
                anchors.centerIn: parent
                maximumLength: 16
                focus: true
                font.pixelSize: 16
                onTextChanged: {
                    root.filter(text)
                }
            }
            Image{
                id: searchPic
                anchors.left: parent.left
                anchors.top: clear.top
                anchors.bottom: clear.bottom
                anchors.margins: 5
                width: height
                source: "image/search.png"
            }
            Image {
                id: clear
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: height
                anchors.margins: 3
                visible: input.text.length > 0
                source: "image/clear.png"
                MouseArea{
                    anchors.fill: parent
                    onClicked: input.text = ""
                }
            }
        }
    }
}
