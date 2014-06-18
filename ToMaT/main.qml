import QtQuick 2.1
import QtQuick.Window 2.1
import QtQuick.Layouts 1.1
import QtMultimedia 5.0
import "content/mylogic.js" as Logic
import "content"


Window {
    id: window
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    minimumHeight: 480
    minimumWidth: 640


    TelaInicial {
        id: telaInicial
        anchors.fill: parent
        visible: true
        onVisibleChanged: visibilidadeTelaInicial()

        function visibilidadeTelaInicial() {
            if (!telaInicial.visible) {
                jogo.visible = true
            }
        }
    }


    // Exemplo pra chamar quarto
    Jogo {
        id: jogo
        anchors.fill: parent
        visible: false
        onVisibleChanged: visibilidadeJogo()

        Component.onCompleted: {
            jogo.init()


    }

    ImageModel{
        id:imageModel
     }


    function visibilidadeJogo() {
       if (jogo.visible) {

            jogo.state = "INICIADO"

       }
       else {

           jogo.state = "PARADO"
           telaInicial.visible = true
       }
    }

    MouseArea {
        anchors.fill:parent
        onClicked: {
            enabled = false
            jogo.visible = true
        }
    }
}


}
