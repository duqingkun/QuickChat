import QtQuick 2.0
import QuickChat.model 1.0

Item{
    id:root

    property color color: "#f1f1f1"
    property color selectedColor: "#ddd"
    property color hoverColor: "#eee"

    Rectangle{
        anchors.fill: parent
        color: root.color

        Rectangle{
            id: search
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 50
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
                        view.model.filter(text)
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

        ListView{
            id: view
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: search.bottom
            anchors.bottom: parent.bottom
            model: ContactModel{}
            delegate: ContactDelegate{
                width: view.width
                height: 60
                userId: model.id
                avatar: model.avatar
                nickname: model.nickname
                lastMsg: model.lastMsg
                datetime: model.datetime
                color: ListView.isCurrentItem ? root.selectedColor : (hovered ? root.hoverColor : root.color)

                property bool hovered: false

                MouseArea{
                    anchors.fill: parent
                    onClicked: view.currentIndex = index
                    onEntered: parent.hovered = true
                    onExited: parent.hovered = false
                }
            }

            Component.onCompleted: {
                view.currentIndex = -1
            }
        }
    }

    function append(id, avatar, nickname, lastMsg, datetime){
        view.model.append(id, avatar, nickname, lastMsg, datetime)
    }
}
