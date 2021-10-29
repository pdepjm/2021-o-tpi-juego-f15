import wollok.game.*
import jugador.*
import NPCs.*
import metodosGenericos.*
import direcciones.*
import nivel.*
import soundProducer.*

class Objeto {
	const property esAtravesable = true
	var property position = game.at(10,10)
	var imageAux
	
	method imageAux(auxiliar) { imageAux = auxiliar } 
	
	method image() = "objetos/" + imageAux + ".png"
	
	method efectoHumo(){}
	
	method estaMuerto() = false

	method interaccion() { jugador.reemplazarObjeto(self) }
	
	method vioMuerto(){}
	
	method explotar(){ nivel.quitar(self) }
	
	method soltar(){
		position = jugador.position()
		nivel.agregar(self)
		jugador.objeto(vacio)
	}
	
	method morir() {}
	
	method serAgarrado() {
		jugador.objeto(self)
		nivel.quitar(self)
    }
    
    method tirar(){ game.say( jugador, "Podria servirme en un futuro el objeto " + self.toString() ) }
    
}

class Remera inherits Objeto ( imageAux = "remera" ){
	method usar() {
		jugador.cambiarRopa()
		jugador.objeto(vacio)
	}
}

class Cuchillo inherits Objeto ( imageAux = "cuchi" ){
	method usar() { direcciones.cercanosA( jugador, 1, nivel.interactuables() ).forEach({ npc => npc.morir() }) }
}

object vacio {
	method interaccion() { jugador.reemplazarObjeto(self) }
	
	method usar(){}
	
	method soltar(){}
	
	method serAgarrado() { jugador.objeto(self) }
}

class Veneno inherits Objeto ( imageAux = "veneno" ){
	var usos = 3
	
	method usar() {
		const aux = direcciones.cercanosA( jugador, 1, nivel.interactuables() )
		if( aux.equals([]).negate() )
			self.envenenar( aux.head() )
		usos -= 1
		if( usos.equals(0) ) jugador.objeto(vacio)
	}
	
	method envenenar(npc){ game.schedule(5000, {npc.morir()}) }
}

class Bomba inherits Objeto { // habria que modificar radios de explosion o agrandar imagen
	var tipo
	
	override method explotar(){}
	
	method explotarse(){ nivel.quitar(self) }
	
	method preExplosion(){
		game.onTick(250, "explosion1", { imageAux = "preExplosion1"  })
		game.onTick(500, "explosion2", { imageAux = "preExplosion2" })
  		game.schedule(2000, {
  			game.removeTickEvent("explosion1")
  			game.removeTickEvent("explosion2")
  			tipo.explosion(self)
  		})
	}
	
	method usar() {
		self.soltar()
		self.preExplosion()
	}
	
	method tipo() = tipo
}

object explosiva {
	method explosion(bomba){
		game.onTick(1 ,"explosion bomba", {soundProducer.explosionExplosion()}) // para que no rompan los tests de la bomba
		bomba.imageAux("explosion")
		direcciones.cercanosA( bomba, 5, nivel.interactuables() + [jugador] ).forEach({ npc => npc.explotar() })
		game.schedule(1000, { bomba.explotarse() })
	}
}

object humo {
	method explosion(bomba){
		game.onTick(1 ,"explosion bomba humo", {soundProducer.smokeExplosion()})
		bomba.imageAux("smoke")
		direcciones.cercanosA( bomba, 4, nivel.interactuables() + [jugador] ).forEach({ npc => npc.efectoHumo() })
		game.schedule(1000, { bomba.explotarse() })
	}
}

/*class Bomba inherits Objeto{
	method sonidoExplosion()
	
	method preExplosion(){
		game.onTick(250, "explosion", { imageAux = "preExplosion"  })
		game.onTick(300, "explosion", { imageAux = "bomb" })
  		game.schedule(900, {
  			game.removeTickEvent("explosion")
  		})
	}
	
	method explosion(){ game.schedule(1000, { nivel.quitar(self) }) }
	
	method usar() {
		self.soltar()
		// sonido y cambio de imagen pls, que sea un method para ambos asi podemos darle una imagen y sonido especial a cada tipo de bomba
		self.preExplosion()
		game.schedule(2000, { self.explosion() } )
	}
}


class BombaExplosiva inherits Bomba (imageAux = "bomb") {
	override method explosion(){ 
		super()
		direcciones.cercanosA(self, 5, nivel.interactuables()+[jugador]).forEach({npc=>npc.explotar()})
  		self.sonidoExplosion()
  		self.explotar()
	}
	
	override method sonidoExplosion(){ soundProducer.explosionExplosion() }
	
	override method explotar(){ imageAux = "explosion" }
}

class BombaDeHumo inherits Bomba (imageAux = "Smokebomb"){
	override method explosion(){
		super()
		direcciones.cercanosA(self, 5, nivel.interactuables()+[jugador]).forEach({npc=>npc.efectoHumo()})
  		self.sonidoExplosion()
  		self.explotar()
	}
		
	override method sonidoExplosion(){ soundProducer.smokeExplosion() }
	
	override method explotar(){ imageAux = "smoke" }
}*/