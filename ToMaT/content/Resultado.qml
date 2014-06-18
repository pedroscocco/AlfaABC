import QtQuick 2.1
import QtQuick.Layouts 1.1
import QtMultimedia 5.0

Item {
    id: resultado
    property bool sucesso

    function prepare(res) {
        if(res) {
            telaResultado.state = "HIGH"
        }
        else {
            telaResultado.state = "LOW"
        }

        /*if(pontuation >= 0 && pontuation <= 4) {
            if(pontuation < 3) {
                telaResultado.state = "LOW"
            }
            else {
                telaResultado.state = "HIGH"
            }
            background.source = "../images/Result"+pontuation+".jpg"
        }*/
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
            source: "../images/Result0.jpg"
            anchors.fill: parent
        }

        Item {
            id: opcoes
            height: parent.height/2
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
                        resultado.visible = false
                        atividade.visible = true
                        if(telaResultado.state === 'LOW') {
                            atividade.retry()
                        }
                        else if(telaResultado.state === 'HIGH') {
                            atividade.next()
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
                        resultado.visible = false
                    }
                }
            }

        }
    }

}
