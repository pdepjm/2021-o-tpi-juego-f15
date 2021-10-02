import wollok.game.*
import soundProducer.*
import direcciones.*
import objetos.*
import jugador.*
import nivel.*


class Civil {
	var property position = game.at(5,5) 
	
	method esObjeto() = false 
	
	method image() = "npcfeo.png"
	
	method morir(){
		const sangre = new Cadaver(position = self.position())
		game.addVisual(sangre)
		game.removeVisual(self) 
		soundProducer.sound("sounds/Death Sound.mp3").play() 
		
	}
	
	method moverse(){ //no se mueven asi pero es para probar una cosa
		const aux = direcciones.direccionRandom()
		self.moverPara(aux)
		
		/*const x = 0.randomUpTo(game.width()).truncate(0)
    	const y = 0.randomUpTo(game.height()).truncate(0)
		position = game.at(x,y)*/
	}
	
	method moverPara(direccion) {
		if(nivel.paredes().contains(direccion.proximaPosicion(position)).negate()){ 
			position = direccion.proximaPosicion(position)
		}
	}
	
	method muertoCerca() = game.colliders(self).filter({cadaver => cadaver.esCadaver()})
	
	
}


class Cadaver {
	var property position 
	
	method esCadaver() = true
	method image() = "blood.png"
	
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
