import wollok.game.*
import soundProducer.*
import direcciones.*
import objetos.*
import jugador.*
import nivel.*

class Civil {
	var property position = null
	var property estaVivo = true
	
	method esObjeto() = false
	
	method image() = "npcfeo.png"
	
	// method muertoCerca() = game.colliders(self).filter({cadaver => cadaver.esCadaver()})
	
	/*	method estaCercaDe(unMuerto){
		if(nivel.existeMuerto(unMuerto) && (self.position().distance(unMuerto.position()) < 5))
		{
			self.position().say(self, "hay un asesino entre nosotros")
		}
	} */

	method estaCercaDeUnMuerto() = self.position().distance(nivel.listaMuertos().anyOne().position()) < 3
	
	method delatarAsesino(){
		if(self.estaCercaDeUnMuerto()){
			game.say(self, "hay un asesino entre nosotros")
			policia.buscarAsesino()
		}
	}
	
	method morir(){
		const sangre = new Cadaver(position = self.position())
		game.addVisual(sangre)
		game.removeVisual(self) 
		soundProducer.sound("sounds/Death Sound.mp3").play()
		estaVivo = false
		return nivel.agregarMuerto(sangre)
	}
	
	method moverse(){ //no se mueven asi pero es para probar una cosa
		const aux = direcciones.direccionRandom()
		self.moverPara(aux)
	}
	
	method moverPara(direccion) {
		if(nivel.paredes().contains(direccion.proximaPosicion(position)).negate()){ 
			position = direccion.proximaPosicion(position)
		}
	}	
}

class Cadaver {
	var property position 
	
	method estaVivo() = false
	method esObjeto() = false
	
	method image() = "blood.png"
}

object policia {
	var property position = null
	var property estaVivo = true
	
	method image() = "police.png"
	
	method buscarAsesino(){ // Falta codear el caso de que el jugador este usando el vestido (en ese caso, no lo encuentra)
		position = jugador.position()
		game.addVisual(self) // CORREGIR TAMAÑO DEL POLICIA (queda muuuyy grande respecto a todo lo demas)
		game.say(self, "Te hemos encontrado, has perdido!!")
		game.onTick(2000, "encontrarAsesino", {game.stop()})
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