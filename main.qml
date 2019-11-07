import QtQuick 2.12
import QtQuick.Window 2.12
import QuickChat.model 1.0

Window {
    visible: true
    width: 340
    height: 480
    title: qsTr("Hello World")

    ContactModel{
        id: contactModel
    }

    ListView{
        id: view
        anchors.fill: parent
        model: contactModel
        delegate: viewDelegate
    }

    Component.onCompleted: {
        contactModel.insert(0, 1, "avatar/wechat.png", "傻媳妇儿", "爱你哦", "18:18")
        contactModel.insert(0, 1, "avatar/alipay.png", "傻媳妇儿2", "你是不是傻，你是不是二，你是不是臭", "2019-11-07")
    }

    Component{
        id: viewDelegate
        //property alias text: text.text

        Rectangle{
            width: view.width
            height: 70
            color: ListView.isCurrentItem ? "#ddd" : (hovered ? "#eee" : "#f1f1f1")
            property bool hovered: false

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
                    source: model.avatar
                }
                Text {
                    id: nickname
                    anchors.top: parent.top
                    anchors.left: avatar.right
                    anchors.topMargin: 3
                    anchors.leftMargin: 10
                    font.bold: true
                    font.pixelSize: 16
                    text: model.nickname
                }
                Text {
                    id: lastMsg
                    anchors.left: nickname.left
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 3
                    anchors.right: datetime.right
                    elide: Text.ElideRight
                    text: model.lastMsg
                    color: "gray"
                }
                Text {
                    id: datetime
                    anchors.right: parent.right
                    anchors.top: avatar.top
                    text: model.datetime
                }
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    view.currentIndex = index
                }
                onEntered: parent.hovered = true
                onExited: parent.hovered = false
            }
        }
    }
}
