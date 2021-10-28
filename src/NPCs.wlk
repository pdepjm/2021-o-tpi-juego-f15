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

class Civil inherits SerVivo {
	var property radioDeVision = 7
	var property estado = vivo
	var property ultimaPos = position
	var property cargado = false
	var property asustado = false
	
	method explotar(){
		self.morir()
	}
	
	method efectoHumo(){
		self.radioDeVision(0)
		game.say(self,"No veoooo")
		game.schedule(7000,{self.radioDeVision(7)})
	}
	
	method estaMuerto() = estado == muerto
	
	method morir() { estado.morir(self) }
	
	method tirar(){ estado.tirar(self) }
	
	method estaCercaDelAsesino() = estado.estaCercaDelAsesino(self)
	
	method cadaverCercano() = estado.cadaverCercano(self)
	
	method moverse(){ estado.moverse(self) }
    
    method delatarAsesino(){ estado.delatarAsesino(self) }
    
    method interaccion() { estado.interaccion(self) }
    
    method asustar(){ asustado = true }
    
    method desasustar(){ asustado = false }
    
    override method position() {
    	if (cargado){
	    	ultimaPos = jugador.position().right(1)
	    	return ultimaPos
    	}
    	else if ( estado.equals(muerto)) return ultimaPos
    	else return position
    }
    
    method vioMuerto() = estado.vioMuerto(self)
    
    method delatar(mort, suspect){}
    
    method muertosCercanos() = direcciones.cercanosA(self, 6,nivel.interactuables()).filter({ ob => ob.estaMuerto() })
    
    method delatar() = self.muertosCercanos().any({ ob => ob.position().distance(jugador.position()) <= 4 })
}

object vivo {
	method noVe(npc){npc.radioDeVision(0)}
	
	method ve(npc){npc.radioDeVision(7)}
	
	method morir(npc){
    	npc.ultimaPos( npc.position() )
        game.schedule( 0, { soundProducer.muerte() } ) // no tiene sentido pero es para tests
        contadorKills.subirKills()
        npc.imageAux("muerto")
        npc.estado(muerto)
    }
    
    method tirar(npc){ game.say(jugador, "Primero debo matarlo") }
    
    method moverse(npc){
        npc.sentido( direcciones.direccionRandom() )
        metodos.repetirNVeces(1000, metodos.numeroEntre(5,20), { npc.position( movimiento.mover( npc.sentido(), npc ) ) } )
    }
     
    method vioMuerto(npc){
    	if( npc.muertosCercanos().isEmpty().negate() ){
    		npc.asustar()
    		const loVio =  npc.delatar()
    		game.say(npc, "Esta muertooooo police!!!!")
    		game.schedule( 1000, { 
    			if(loVio) game.say(npc, "LO MATASTE TU")
    			policia.delatar(npc.muertosCercanos(), loVio)
    		})
    		}else npc.desasustar()
    }
    
    method cadaveresCerca(npc) = direcciones.cercanosA(npc, npc.radioDeVision(),nivel.interactuables()).filter({ cad => cad.estaMuerto() })
    
    method interaccion(npc){}
}

object muerto{
	
	method noVe(npc){}
	
	method ve(npc){}
	
	method vioMuerto(npc){}
	
	method estaCercaDelAsesino(npc){}
	
	method cadaverCercano(npc){}
	
	method morir(npc){}
    
    method moverse(npc){}
    
    method tirar(npc){ nivel.quitar(npc) }
    
    method interaccion(npc){ npc.cargado(npc.cargado().negate()) }
	
    method delatarAsesino(npc){}
}

object policia inherits SerVivo { // Hay que arreglar el tema de los tiempos de los schedule para que no salga el error de que ya esta el visual
	var ocupado = false
	var sospechoso = null
	
	override method image() = "personajes/police_" + imageAux + ".png"

	method vioMuerto(){ nivel.interactuables().forEach({ ob => ob.vioMuerto() }) }
	
	method delatar(muertos, culpable){
		if( ocupado.negate()){
			ocupado = true
			sospechoso = jugador.imageAux()
			self.buscarCadaver(muertos,culpable)
		}
	}
	
	method encargarseDeJugador(culpable){
		game.addVisual(self)
			game.say(self, "VOY A BUSCAR AL CANALLA")
			game.schedule(2000, {
				game.removeVisual(self)
				if(culpable and jugador.imageAux() == sospechoso) self.eliminarJugador() else self.noLoEncontre()
				ocupado = false
			})
	}
	
	method noLoEncontre(){
		position = game.at(28,2)
		game.addVisual(self)
		game.say(self, "Se escapo de nuevo")
		game.schedule( 2000, { game.removeVisual(self) } )	
	}
	
	method buscarCadaver(morts,culpable){
		position = morts.head().position()
		game.addVisual(self)
		game.say(self,"me los llevo de aqui")
		game.schedule( 2000, { 
			morts.forEach({mort=>nivel.quitar(mort)}) 
			game.removeVisual(self)
			self.encargarseDeJugador(culpable)
		} )
	}
	
	method eliminarJugador(){ //ARREGLAR
		position = jugador.position()
		game.addVisual(self)
		game.say(self, "Te encontramos pa, perdiste!!")
		game.schedule(500, { self.enojarse() })
		game.schedule(3300, { game.stop() })
	}
	
	method enojarse(){
		imageAux = "enojado"
		soundProducer.horror()
	}
}
