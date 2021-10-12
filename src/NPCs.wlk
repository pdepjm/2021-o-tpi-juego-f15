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
	
	method cadaverCercano() = ( nivel.listaMuertos() ).filter({ cadaver => self.position().distance(cadaver.position()) < 6 })
	
	method estaCercaDelAsesino() = self.position().distance( jugador.position() ) < 5
	
	method delatarAsesino(){
		if( self.cadaverCercano().size() != 0 && self.estaCercaDelAsesino().negate() && self.estaVivo() ){
			game.say(self, "Hay un asesino entre nosotros")
			game.schedule( 2000, { policia.buscarCadaver( self.cadaverCercano() ) } )
		}
		else if( self.estaCercaDelAsesino() && self.cadaverCercano().size() != 0 && self.estaVivo() ){
			game.say(self, "Te descubri!!! Llamare a la policia")
			game.schedule( 1000, { policia.buscarAsesino() } )
		}
	}
	
	method morir(){
		game.schedule( 0, {soundProducer.sound("sounds/Death Sound.mp3").play()} ) //No tiene sentido pero sin esto no lo podia testear
		game.removeVisual(self)
		const sangre = new Cadaver(position = self.position())
		game.addVisual(sangre)
		contadorKills.kills( contadorKills.kills() + 1 )
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
	method image() = "personajes/police.png"
	
	method buscarCadaver(cadaver){
		cadaver.forEach{ muerto => self.eliminarCadaver(muerto) }		
	}
	
	method eliminarCadaver(muerto){
		position = muerto.position()
		game.addVisual(self)
		game.removeVisual(muerto)
		nivel.listaMuertos().remove(muerto) 
		game.schedule(2000, {game.removeVisual(self)})
		game.say(self, "ALEJENSE! Estamos quitando un cadaver!")
	}
	
	method buscarAsesino(){ 
		if(jugador.imageAux() == "vestido"){self.error("")} //si tiene la remera puesta, el policia no lo encuentra aunque este cerca del cadaver
		position = jugador.position()
		game.addVisual(self)
		game.say(self, "Te hemos encontrado, has perdido!!")
		game.onTick(2000, "encontrarAsesino", {game.stop()})	
	}
}
	