import QtQuick 2.1
import QtMultimedia 5.0
import "resources"
import "mylogic.js" as Logic

Item {
    id: quarto
    visible: true
    focus: true

    function mostrarPopup() {
        return Logic.mostrarPopup(airplane.source+"", ball.source+"", chair.source+"", dice.source+"")
    }

    function change() {
        backgroundQuarto.source = "resources/BackgroundRoom2.jpg"
    }

    Rectangle {
        id: telaLetras
        width: parent.width
        height: parent.height

        property int letraSelecionada: 0
        property int letrasVistas: 0

        Image {
            id: backgroundQuarto
            anchors.fill: parent
            source: "resources/BackgroundRoom.jpg"
        }

        Image {
            id: airplane
            source: "resources/AirplaneToRoom.png"
            anchors.top: parent.top
            anchors.right: parent.right
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(quarto.focus) {
                        airplane.source = "resources/AirplaneToRoomClicked.png"
                        letra.letra = "A"
                        letra.imagem = "resources/LetterA.jpg"
                        letra.visible = true
                        buttonClick.play()
                    }
                }
            }
        }

        Image {
            id: ball
            source: "resources/BallToRoom.png"
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(quarto.focus) {
                        parent.source = "resources/BallToRoomClicked.png"
                        letra.letra = "B"
                        letra.imagem = "resources/LetterB.jpg"
                        letra.visible = true
                        buttonClick.play()
                    }
                }
            }
        }

        Image {
            id: chair
            source: "resources/ChairToRoom.png"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(quarto.focus) {
                        parent.source = "resources/ChairToRoomClicked.png"
                        letra.letra = "C"
                        letra.imagem = "resources/LetterC.jpg"
                        letra.visible = true
                        buttonClick.play()
                    }
                }
            }
        }

        Image {
            id: dice
            source: "resources/DiceToRoom.png"
            anchors.top: parent.top
            anchors.left: parent.left
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(quarto.focus) {
                        parent.source = "resources/DiceToRoomClicked.png"
                        letra.letra = "D"
                        letra.imagem = "resources/LetterD.jpg"
                        letra.visible = true
                        buttonClick.play()
                    }
                }
            }
        }

        Image {
            source: "resources/Quit.png"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 10
            // Para voltar ao Menu Inicial
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    if(quarto.focus) {
                        quarto.visible = false;
                        buttonClick.play()
                    }
                }
            }
        }

    }

}
