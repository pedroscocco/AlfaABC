import QtQuick 2.1
import QtMultimedia 5.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import "../images"
import "mylogic.js" as Logic

Item {
    id: quarto
    visible: true
    focus: true

    Rectangle {
        id: telaLetras
        width: parent.width
        height: parent.height

        property int letraSelecionada: 0
        property int letrasVistas: 0

        Image {
            id: backgroundQuarto
            anchors.fill: parent
            source: "../images/stock-photo-illustration-of-a-boy-sleeping-soundly-inside-his-room-133435442.jpg"
        }

        Rectangle {
            id: supE
            anchors.left: parent.left
            anchors.top: parent.top
            height: parent.height/2
            width: parent.width/2
            color: "black"

            Rectangle {
                anchors.centerIn: parent
                width:10; height: 10
                Text {
                    id: supEText
                    text: ""
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    supE.color = "pink"
                }
                onReleased: {
                    supE.color = "black"
                }

            }
        }

        Rectangle {
            id: supD
            anchors.right: parent.right
            anchors.top: parent.top
            height: parent.height/2
            width: parent.width/2
            color: "red"
            Rectangle {
                anchors.centerIn: parent
                width:10; height: 10
                Text {
                    id: supDText
                    text: ""
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    supD.color = "pink"
                }
                onReleased: {
                    supD.color = "black"
                }

            }
        }

        Rectangle {
            id: infE
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            height: parent.height/2
            width: parent.width/2
            color: "blue"
            Rectangle {
                anchors.centerIn: parent
                width:10; height: 10
                Text {
                    id: infEText
                    text: ""
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    infE.color = "pink"
                }
                onReleased: {
                    infE.color = "black"
                }

            }
        }

        Rectangle {
            id: infD
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            height: parent.height/2
            width: parent.width/2
            color: "black"
            Rectangle {
                anchors.centerIn: parent
                width:10; height: 10
                Text {
                    id: infDText
                    text: ""
                }
            }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    infD.color = "pink"
                }
                onReleased: {
                    infD.color = "black"
                }

            }
        }

        Rectangle {
            id: desafio
            anchors.centerIn: parent
            height: parent.height/3
            width: parent.width/3
            color: "white"
            Item {
                anchors.fill: parent
                anchors.margins: 10

                Rectangle {
                    id: n1
                    anchors.left: parent.left
                    height: parent.height
                    width: parent.width*0.4
                    color: "purple"
                }
                Rectangle {
                    anchors.centerIn: parent
                    height: parent.height
                    width: parent.width*0.2
                    color: "transparent"
                    Text {
                        id: mais
                        anchors.centerIn: parent
                        text: "+"
                        font.bold: true
                        font.pointSize: 98*(window.width/Screen.desktopAvailableWidth)
                    }
                }
                Rectangle {
                    id: n2
                    anchors.right: parent.right
                    height: parent.height
                    width: parent.width*0.4
                    color: "yellow"
                }
            }

        }
    }
}
