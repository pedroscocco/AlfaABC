import QtQuick 2.1
import QtQuick.Layouts 1.1

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

        RowLayout {
        id: opcoes
        Layout.alignment: (Qt.AlignHCenter | Qt.AlignVCenter)
        anchors.bottom: parent.bottom

            Image {
                id: estudar
                source: "../images/StudyButton.png"
                Layout.alignment: (Qt.AlignHCenter | Qt.AlignVCenter)
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        estudar.source = "../images/StudyButtonClicked.png"
                        buttonClick.play()
                    }
                    onReleased: {
                        estudar.source = "../images/StudyButton.png"
                    }
                }
            }

            Image {
                id: jogar
                source: src
                Layout.alignment: (Qt.AlignHCenter | Qt.AlignVCenter)
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
                source: "../images/QuitButton.png"
                Layout.alignment: (Qt.AlignHCenter | Qt.AlignVCenter)

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        sair.source = "../images/QuitButtonClicked.png"
                        buttonClick.play()
                    }
                    onReleased: {
                        sair.source = "../images/QuitButton.png"
                        menuInicial.visible = true
                        resultado.visible = false
                    }
                }
            }
        }
    }

}
