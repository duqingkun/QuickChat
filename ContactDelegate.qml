import QtQuick 2.0

Component{
    id: delegate

    Rectangle{
        id: wrapper
        width: ListView.view.width
        height: 60
        color: ListView.isCurrentItem ? selectedColor : (hovered ? hoverColor : nomalColor)

        property bool hovered: false
        property color nomalColor: "#f1f1f1"
        property color selectedColor: "#ddd"
        property color hoverColor: "#eee"

        Rectangle{
            anchors.fill: parent
            anchors.margins: 10
            color: parent.color
            Image{
                id: pic
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                width: height
                source: avatar
            }
            Text {
                id: name
                anchors.top: parent.top
                anchors.left: pic.right
                anchors.topMargin: 3
                anchors.leftMargin: 10
                font.bold: true
                font.pixelSize: 16
                text: nickname
            }
            Text {
                id: lastMessage
                anchors.left: name.left
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 3
                anchors.right: dt.right
                elide: Text.ElideRight
                text: lastMsg
                color: "gray"
            }
            Text {
                id: dt
                anchors.right: parent.right
                anchors.top: pic.top
                text: datetime
            }
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: parent.hovered = true
            onExited: parent.hovered = false
            onClicked: wrapper.ListView.view.currentIndex = index
        }
    }
}
