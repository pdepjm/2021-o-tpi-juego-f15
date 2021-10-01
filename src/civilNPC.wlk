import wollok.game.*
import soundProducer.*

class Civil {
	var property position = game.at(1,0)
	
	method esObjeto() = false
	method image() = "npcfeo.png"
	method morir(){
		game.removeVisual(self)
		soundProducer.sound("sounds/Death Sound.mp3").play()
	}
}
	/*
	method verMuerto(muerto){
		if (jugador.cercaCadaver(muerto)) 	self.delatarJugador(asesino,muerto) else self.llamarPolicia(muerto)
	}
	method delatarJugador(asesino,cadaver){
		policia.asesino(asesino)
		self.llamarPolicia(cadaver)
	}
	method llamarPolicia(cadaver){
		polcia.buscarCadaverYAsesino()
	}
	method caminar(x,y){
		/* funcion azarosa donde el npc se mueve cada cierto tiempo  */
	/*
	}
	method morir(){
		/* destruir objeto y generar otro de sangre */
	/*}*/
