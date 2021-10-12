import wollok.game.*
import nivel.*
import soundProducer.*

// Carga

object pantallaDeCarga {
	method image() = "backround.png"
	method position() = game.origin()

    method configuracionInicial(){
    	game.clear()
        game.addVisual(self)
        game.schedule(2000, {=> game.addVisual(mensajeCarga)})
        self.configurarTeclas()
    }
    method configurarTeclas(){
        keyboard.enter().onPressDo({ if(game.hasVisual(self)) nivel.configuracionInicial() })
	}
}

object mensajeCarga {
	method image() = "message.png"
	method position() = game.at(10,2)
}

// Victoria

object pantallaDeVictoria {
	method image() = "pantallaVictoria.jpg"
	method position() = game.origin()
	
	method ganar(){
		game.clear()
		game.addVisual(self)
		soundProducer.playVictory()
		game.schedule(2000, {=>
			game.addVisual(mensajeReinicio)
			game.addVisual(mensajeQuit)
		})
		self.configurarTeclas()
	}
	
	method configurarTeclas(){
		keyboard.space().onPressDo({ game.stop() })
		keyboard.enter().onPressDo({
			if(game.hasVisual(self)){
            	pantallaDeCarga.configuracionInicial()
        	}
        })
	}
}

object mensajeReinicio {
	method image() = "message2.png"
	method position() = game.at(10,4)
}

object mensajeQuit {
	method image() = "message3.png"
	method position() = game.at(12,2)
}