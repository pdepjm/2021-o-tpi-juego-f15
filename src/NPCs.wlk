import wollok.game.*
import soundProducer.*
import direcciones.*
import objetos.*
import jugador.*
import nivel.*
import interactuables.*
import metodosGenericos.*
import contador.*

/*class Culpable{
	var property quien = null
	var property que = null
	var property culpable = null
}*/

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

class Civil inherits SerVivo {
	var property estado = vivo
	var property ultimaPos = position
	var property cargado = false
	
	method estaMuerto() = estado == muerto
	
	method morir() { estado.morir(self) }
	
	method tirar(){estado.tirar(self)}
	
	method estaCercaDelAsesino() = estado.estaCercaDelAsesino(self)
	
	method cadaverCercano() = estado.cadaverCercano(self)
	
	method moverse(){ estado.moverse(self) }
    
    method delatarAsesino(){ estado.delatarAsesino(self) }
    
    method interaccion() { estado.interaccion(self) }
    
    override method position() {
    	if (cargado) return jugador.position().right(1) 
    	else if ( estado.equals(muerto) ) return ultimaPos
    	else return position
    }
    
    method vioMuerto() = estado.vioMuerto(self)
    
    method delatar(mort, suspect){}
    
    method muertosCercanos() = direcciones.cercanosA(self, 6).filter({ ob => ob.estaMuerto() })
    
    method delatar() = self.muertosCercanos().any({ ob => ob.position().distance(jugador.position()) <= 4 })
}

object vivo {
	const radioDeVision = 7
	
	// method estaCercaDelAsesino(npc) = npc.position().distance( jugador.position() ) < radioDeVision
	
	// method cadaverCercano(npc) = nivel.listaMuertos().filter({ cadaver => npc.ultimaPos().distance(cadaver.position()) < radioDeVision })
	
    method morir(npc){
    	npc.ultimaPos( npc.position() )
        game.schedule( 0, { soundProducer.muerte() } ) // no tiene sentido pero es para tests
        contadorKills.subirKills()
        npc.imageAux("muerto")
        npc.estado(muerto)
    }
    
    method tirar(npc){ game.say(jugador, "Primero debo matarlo") }
    
    method moverse(npc){
        npc.sentido(direcciones.direccionRandom())
        metodos.repetirNVeces(1000, metodos.numeroEntre(5,20), { npc.position(movimiento.mover(npc.sentido(), npc)) } )
    }
    
    method interaccion(npc){}
    
    /*
    method delatarAsesino(npc){
    	//game.say(npc, "Llamen a la policia. Acaso no piensan en los niños?")
    	policia.recibirLlamado(npc)
    }
     */
     
    method vioMuerto(npc){
    	if(npc.muertosCercanos().isEmpty().negate())
    		policia.delatar(npc.muertosCercanos(),npc.delatar())
    }
    
    method cadaveresCerca(npc) = direcciones.cercanosA(npc, radioDeVision).filter({ cad => cad.estaMuerto() })

}

object muerto{
	method vioMuerto(npc){}
	
	method estaCercaDelAsesino(npc){}
	
	method cadaverCercano(npc){}
	
	method morir(npc){}
    
    method moverse(npc){}
    
    method tirar(npc){nivel.quitar(npc)}
    
    method interaccion(npc){ npc.cargado(npc.cargado().negate()) }
	
    method delatarAsesino(npc){}
}

object policia inherits SerVivo {
	//var busco = false
	
	override method image() = "personajes/police_" + imageAux + ".png"

	method vioMuerto(){ nivel.interactuables().forEach({ob=>ob.vioMuerto()}) }
	
	method delatar(muertos,culpable){
		const identidad = jugador.imageAux()
		
		if( game.hasVisual(self).negate()){
			position = muertos.head().position()
			game.addVisual(self)
			muertos.forEach{ muerto => nivel.quitar(muerto)}
			game.schedule( 2000, { game.removeVisual(self) } )
			game.schedule( 2000, {
				if(culpable){
					if(jugador.imageAux()==identidad)
						self.eliminarJugador()
				}
			})	
		}
	}

	/* 
	
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
	*/
	
	method enojarse(){
		imageAux = "enojado"
		soundProducer.horror()
	}
	
	/*
	method buscarAsesino(){
		if(jugador.estaVestido().negate() or busco)
			self.eliminarJugador()
		game.schedule( 500, { busco = true } )
	}
	 */
	 
	method eliminarJugador(){ //ARREGLAR
		position = jugador.position()
		game.addVisual(self)
		game.say(self, "Te encontramos pa, perdiste!!")
		game.schedule(200, { self.enojarse() })
		game.schedule(3000, {game.stop() })
	}
}

	/*
	method recibirLlamado(personaQueLLama){
		if( personaQueLLama.cadaverCercano().size() != 0 and game.hasVisual(self).negate() ){
            if( personaQueLLama.estaCercaDelAsesino().negate() ){
                self.buscarCadaver( personaQueLLama.cadaverCercano() )
            }
            else self.buscarAsesino()
        }
	}
	*/