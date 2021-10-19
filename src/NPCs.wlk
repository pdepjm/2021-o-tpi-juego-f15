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
	const property esAtravesable = true
	var property sentido = abajo
	var property imageAux = "default"
	const identidad = "npc"
	
	method image() = "personajes/" + identidad + "_" + sentido + "_" + imageAux + ".png"
	
	method serAgarrado() {}
}
class NPC inherits SerVivo {
	var property position = null
}

class Civil inherits NPC { // cambiar lo de cadaver
	const radioDeVision = 5
	
	method cadaverCercano() = nivel.listaMuertos().filter({ cadaver => position.distance(cadaver.position()) < radioDeVision })
	
	method estaCercaDelAsesino() = position.distance( jugador.position() ) < radioDeVision
	
	method delatarAsesino(){ // declaratividad en ifs | ver si delegar a poli
		if( self.cadaverCercano().size() != 0 && estaVivo){
			if( self.estaCercaDelAsesino().negate()){
				game.say(self, "Hay un asesino entre nosotros")
				policia.buscarCadaver( self.cadaverCercano() )
			}
			else{
				game.say(self, "Te descubri!!! Llame a la cana")
				policia.buscarAsesino()
			}
		}
	}
	
	method morir(){
		game.schedule( 0, {soundProducer.muerte()} ) // No tiene sentido pero sin esto no lo podia testear
		game.removeVisual(self)
		self.estaVivo(false)
		const cadaver = new Cadaver( ultimaPos = position )
		position = game.origin() // es un parche, deberia solucioanrse de otra manera mepa
		game.addVisual(cadaver)
		contadorKills.subirKills()
		return nivel.agregarMuerto(cadaver)
	}
	
	method moverse(){
		sentido = direcciones.direccionRandom()
		metodos.repetirNVeces(1000, metodos.numeroEntre(5,20), { position = movimiento.mover(sentido, self) } )
	}
	
	method interaccion() { }
	
}

object policia inherits NPC {
	override method image() = "personajes/police_" + imageAux + ".png"
	
	method buscarCadaver(cadaver){
		game.schedule(1000, {cadaver.forEach{ muerto => self.eliminarCadaver(muerto) }})		
	}
	
	method eliminarCadaver(muerto){
		if( game.hasVisual(self).negate() ){
			position = muerto.position()
			game.addVisual(self)
			game.removeVisual(muerto)
			nivel.removerMuerto(muerto) // revisar no toketear a nivel
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
				imageAux = "enojado"
				soundProducer.horror()
			})
			game.schedule(3000, {game.stop()})
		}
		})
	}
}
	