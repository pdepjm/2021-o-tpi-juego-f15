import wollok.game.*
class Civil {
	
	const posicion = game.at(2,2)
	method image(){
		return "npcfeo.png"
	}
	method position() {
		return posicion
	}
	method morir(){
		game.removeVisual(self)
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
