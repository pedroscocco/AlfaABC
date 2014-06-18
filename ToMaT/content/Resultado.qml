import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import QtMultimedia 5.0

Item {
    id: resultado
    property bool sucesso
    property string bg: ""
    property bool out

    property string num1
    property string num2
    property string resp

    property bool retry: false

    function prepare(res) {
        if(res) {
            telaResultado.state = "HIGH"
            background.source = bg
        }
        else {
            telaResultado.state = "LOW"
            background.source = bg
        }

        n1.source = num1
        n2.source = num2
        n3.source = resp
    }

    SoundEffect {
        id: buttonClick
        source: "../images/sounds/ButtonSelect1.wav"
        //source: "resources/sounds/ButtonSelect2.wav"
    }

    Rectangle {
        id: telaResultado
        anchors.fill: parent

        states: [
            State {
                name: "LOW"
                PropertyChanges {
                    target: jogar
                    src: "../images/PlayAgainButton.png"
                    srclkd: "../images/PlayAgainButtonClicked.png"
                }
            },
            State {
                name: "HIGH"
                PropertyChanges {
                    target: jogar
                    src: "../images/PlayNextButton.png"
                    srclkd: "../images/PlayNextButtonClicked.png"
                }
            }

        ]
        Image {
            id: background
            source: bg
            anchors.fill: parent
        }

        Rectangle {
            id: desafio
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 0
            height: parent.height/2
            width: 4*parent.width/5
            y: parent.height/6
            gradient: Gradient {
                     GradientStop { position: 0.0; color: "white" }
                     GradientStop { position: 1.0; color: "#d7d7d7" }
                 }
            radius: 500
            border.color: "#b7b7b7"
            border.width: 1
            Item {
                anchors.fill: parent
                anchors.margins: 10

                Rectangle {

                    anchors.left: parent.left
                    height: parent.height
                    width: parent.width*0.20
                     color: "transparent"
                    Image{
                        fillMode: Image.PreserveAspectFit
                        id: n1
                        anchors.fill:parent
                     }

                }
                Rectangle {
                     anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.20
                    height: parent.height
                    width: parent.width*0.1
                    color: "transparent"
                    Text {
                        id: mais
                        anchors.centerIn: parent
                        text: "+"
                        font.bold: true
                        font.pointSize: 50*(window.width/Screen.desktopAvailableWidth)
                    }
                }
                Rectangle {
                     anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.30
                    height: parent.height
                    width: parent.width*0.30
                     color: "transparent"
                    Image{
                        anchors.fill:parent
                        fillMode: Image.PreserveAspectFit
                        id: n2
                     }
                }
                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width*0.60)
                    height: parent.height
                    width: parent.width*0.1
                    color: "transparent"
                    Text {
                        id: igual
                        anchors.centerIn: parent
                        text: "="
                        font.bold: true
                        font.pointSize: 50*(window.width/Screen.desktopAvailableWidth)
                    }
                }

                Rectangle {
                    anchors.left: parent.left
                    anchors.leftMargin: (parent.width*0.70)
                    height: parent.height
                    width: parent.width*0.30
                    color: "transparent"
                    Image{
                        anchors.fill:parent
                        fillMode: Image.PreserveAspectFit
                        id: n3
                     }
                }
            }

        }

        Item {
            id: opcoes
            height: parent.height/4
            width: parent.width
            anchors.bottom: parent.bottom

            Image {
                id: jogar
                width: parent.width/2
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: src
                property string src: "../images/PlayAgainButton.png"
                property string srclkd: "../images/PlayAgainButtonClicked"

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        jogar.source = jogar.srclkd
                        buttonClick.play()
                    }
                    onReleased: {
                        jogar.source = jogar.src
                        resultado.out = false
                        resultado.visible = false
                        if(telaResultado.state === 'LOW') {
                            retry = true
                        }
                        else if(telaResultado.state === 'HIGH') {
                            retry = false
                        }
                    }
                }
            }

            Image {
                id: sair
                width: parent.width/2
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                x: parent.width/2
                source: "../images/QuitButton.png"

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        sair.source = "../images/QuitButtonClicked.png"
                        buttonClick.play()
                    }
                    onReleased: {
                        sair.source = "../images/QuitButton.png"
                        resultado.out = true
                        resultado.visible = false
                    }
                }
            }

        }
    }

}
