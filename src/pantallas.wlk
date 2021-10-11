import wollok.game.*
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

object backroundCarga {
	method image() = "backround.png"
	method position() = game.origin()
}

object mensajeCarga {
	method image() = "message.png"
	method position() = game.at(10,2)
}

object pantallaDeVictoria {
	method image() = "pantallaVictoria.jpg"
	method position() = game.origin()
	
	method ganar(){
		//game.addVisual(self)
		//soundProducer.playVictory()
	}
}