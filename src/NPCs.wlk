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
	var property position = game.origin()
	method image() = "personajes/" + identidad + "_" + sentido + "_" + imageAux + ".png"
	
	method serAgarrado() {}
}

class Civil inherits SerVivo { // cambiar lo de cadaver
	var property estado = vivo
	var property ultimaPos = position
	var property cargado = false
	
	method morir() { estado.morir(self) }
	
	method estaCercaDelAsesino() = estado.estaCercaDelAsesino(self)
	
	method cadaverCercano() = estado.cadaverCercano(self)
	
	method moverse(){ estado.moverse(self) }
    
    method delatarAsesino(){ estado.delatarAsesino(self) }
    
    method interaccion() { estado.interaccion(self) }
    
    override method position() {
		if(cargado) return jugador.position().right(1)
		else if (estado.equals(muerto)) return ultimaPos
		else return position
	}
 
}

object vivo {
	const radioDeVision = 7
	
	method estaCercaDelAsesino(npc) = npc.position().distance( jugador.position() ) < radioDeVision
	
	method cadaverCercano(npc) = nivel.listaMuertos().filter({ cadaver => npc.ultimaPos().distance(cadaver.position()) < radioDeVision })
	
    method morir(npc){
        game.schedule( 0, {soundProducer.muerte()} ) // no tiene sentido pero es para tests
        contadorKills.subirKills()
        npc.imageAux("muerto")
        npc.ultimaPos(npc.position())
        npc.estado(muerto)
        nivel.agregar(npc)
        nivel.agregarMuerto(npc)
    }
    
    method moverse(npc){
        npc.sentido(direcciones.direccionRandom())
        metodos.repetirNVeces(1000, metodos.numeroEntre(5,20), { npc.position(movimiento.mover(npc.sentido(), npc)) } )
    }
    
    method interaccion(npc){}
    
    method delatarAsesino(npc){
    	//game.say(npc, "Llamen a la policia. Acaso no piensan en los niños?")
    	policia.recibirLlamado(npc)
    }
}

object muerto{
	method estaCercaDelAsesino(npc){}
	
	method cadaverCercano(npc){}
	
	method morir(npc){}
    
    method moverse(npc){}
    
    method interaccion(npc){
    	npc.cargado(npc.cargado().negate())
    	npc.ultimaPos(jugador.position().right(1))
    }
	
    method delatarAsesino(npc){}
}

object policia inherits SerVivo {
	var busco = false
	
	override method image() = "personajes/police_" + imageAux + ".png"
	
	method buscarCadaver(cadaver){
		game.schedule( 1000, { cadaver.forEach{ muerto => self.eliminarCadaver(muerto) }} )		
	}
	
	method eliminarCadaver(muerto){
		if( game.hasVisual(self).negate() ){
			position = muerto.position()
			game.addVisual(self)
			nivel.quitar(muerto)
			nivel.removerMuerto(muerto)
			//nivel.removerMuerto(muerto)
			game.schedule( 2000, { game.removeVisual(self) } )
			game.say(self, "ALEJAOS! Estamos haciendo la removicion de un cadaver!")
		}
	}
	
	method enojarse(){
		imageAux = "enojado"
		soundProducer.horror()
	}
	
	method buscarAsesino(){
		if(jugador.estaVestido().negate() or busco)
			self.eliminarJugador()
		game.schedule( 500, { busco = true } )
	}
	
	method eliminarJugador(){ //ARREGLAR
		game.schedule( 1000,{//si tiene la remera puesta, el policia no lo encuentra aunque este cerca del cadaver
		
		position = jugador.position()
		game.addVisual(self)
		game.say(self, "Te encontramos pa, perdiste!!")
		game.schedule(200, { self.enojarse() })
		game.schedule(3000, {game.stop()})
		})
	}
	
	method recibirLlamado(personaQueLLama){
		if( personaQueLLama.cadaverCercano().size() != 0 and game.hasVisual(self).negate() ){
            if( personaQueLLama.estaCercaDelAsesino().negate() ){
                self.buscarCadaver( personaQueLLama.cadaverCercano() )
            }
            else self.buscarAsesino()
        }
	}
}
	