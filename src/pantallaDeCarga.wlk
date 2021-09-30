import wollok.game.*
import objetosNiveles.*
import nivel.*
import soundProducer.*

object pantallaDeCarga {

    method configuracionInicial(){
        game.addVisual(backroundCarga)
        game.schedule(2000, {=> game.addVisual(mensajeCarga)})
        self.configurarTeclas()
    }

    method configurarTeclas(){

        keyboard.enter().onPressDo({
        	if(game.hasVisual(backroundCarga)){
            	game.clear()
            	soundProducer.playMusic()
            	nivel.configuracionInicial()
        	}
        })
	}
}