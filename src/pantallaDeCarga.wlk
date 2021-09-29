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

	method configurarTeclas(){ keyboard.enter().onPressDo({ 
		game.removeVisual(mensajeCarga)
		game.removeVisual(backroundCarga)
		soundProducer.playMusic()
		nivel.configuracionInicial()
	}) }
}
