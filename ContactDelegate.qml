import QtQuick 2.0

Item{
    id: root

    property alias color: background.color

    property int userId
    property string avatar
    property string nickname
    property string lastMsg
    property string datetime

    Rectangle{
        id: background
        width: parent.width
        height: parent.height

        Rectangle{
            anchors.fill: parent
            anchors.margins: 10
            color: parent.color
            Image{
                id: avatar
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: height
                source: root.avatar
            }
            Text {
                id: nickname
                anchors.top: parent.top
                anchors.left: avatar.right
                anchors.topMargin: 3
                anchors.leftMargin: 10
                font.bold: true
                font.pixelSize: 16
                text: root.nickname
            }
            Text {
                id: lastMsg
                anchors.left: nickname.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                anchors.right: datetime.right
                elide: Text.ElideRight
                text: root.lastMsg
                color: "gray"
            }
            Text {
                id: datetime
                anchors.right: parent.right
                anchors.top: avatar.top
                text: root.datetime
            }
        }
    }
}
