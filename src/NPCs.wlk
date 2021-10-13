import wollok.game.*
import soundProducer.*
import direcciones.*
import objetos.*
import jugador.*
import nivel.*
import interactuables.*
import metodosGenericos.*
import contador.*

class SerVivo {
	var property estaVivo = true
	const property objetoAtravesable = true
	const property esObjeto = false
	const property esInteractuable = false
}
class NPC inherits SerVivo {
	var property position = null
	const property esNPC = true
}

class Civil inherits NPC {
	var property image = "personajes/npc_abajo.png"
	const radioDeVision = 5
	
	method cadaverCercano() = nivel.listaMuertos().filter({ cadaver => position.distance(cadaver.position()) < radioDeVision })
	
	method estaCercaDelAsesino() = position.distance( jugador.position() ) < radioDeVision
	
	method delatarAsesino(){
		if( self.cadaverCercano().size() != 0 && self.estaCercaDelAsesino().negate() && estaVivo){
			game.say(self, "Hay un asesino entre nosotros")
			policia.buscarCadaver( self.cadaverCercano())
		}
		else if( self.estaCercaDelAsesino() && self.cadaverCercano().size() != 0 && estaVivo){
			game.say(self, "Te descubri!!! Llamare a la policia")
			policia.buscarAsesino()
		}
	}
	
	method morir(){
		game.schedule( 0, {soundProducer.sound("sounds/Death Sound.mp3").play()} ) //No tiene sentido pero sin esto no lo podia testear
		game.removeVisual(self)
		const sangre = new Cadaver(position = position)
		game.addVisual(sangre)
		contadorKills.subirKills()
		self.estaVivo(false)
		return nivel.agregarMuerto(sangre)
	}
	
	method moverse(){
		metodos.repetirNVeces(1000, metodos.numeroEntre(5,20), { position = movimiento.mover(direcciones.direccionRandom(), self) } )
	}
	
	method imageFlip(direccion){
		image = "personajes/npc_" + direccion + ".png"
	}
}

object policia inherits NPC {
	var property image = "personajes/police.png"
	
	method buscarCadaver(cadaver){
		game.schedule(1000, {cadaver.forEach{ muerto => self.eliminarCadaver(muerto) }})		
	}
	
	method eliminarCadaver(muerto){
		if( game.hasVisual(self).negate() ){
			position = muerto.position()
			game.addVisual(self)
			game.removeVisual(muerto)
			nivel.listaMuertos().remove(muerto) 
			game.schedule(2000, {game.removeVisual(self)})
			game.say(self, "ALEJAOS! Estamos haciendo la removicion de un cadaver!")
		}
	}
	
	method buscarAsesino(){
		game.schedule(1000,{
		if(jugador.estaVestido()){ self.error("") } //si tiene la remera puesta, el policia no lo encuentra aunque este cerca del cadaver
		if( game.hasVisual(self).negate() ){
			position = jugador.position()
			game.addVisual(self)
			game.say(self, "Te encontramos pa, perdiste!!")
			game.schedule(200, {
				image = "personajes/police2.png"
				jugador.miedo(true)
				soundProducer.horror()
			})
			game.schedule(2800, {game.stop()})
		}
		})
	}
}
	