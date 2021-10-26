import wollok.game.*
import jugador.*
import NPCs.*
import metodosGenericos.*
import direcciones.*
import nivel.*

class Objeto {
	const property esAtravesable = true
	var property position = game.at(10,10)
	const imageAux
	
	method image() = "objetos/" + imageAux + ".png"
	
	method efectoHumo(){}
	
	method estaMuerto() = false

	method interaccion() { jugador.reemplazarObjeto(self) }
	
	method vioMuerto(){}
	
	method explotar(){
		nivel.quitar(self)
	}
	
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
    
    method tirar(){ game.say(jugador, "Podria servirme en un futuro el objeto " + self.toString()) }
    
}

class Remera inherits Objeto (imageAux = "remera"){
	method usar() {
		jugador.cambiarRopa()
		jugador.objeto(vacio)
	}
}

class Cuchillo inherits Objeto (imageAux = "cuchi"){
	method usar() { direcciones.cercanosA(jugador,1,nivel.interactuables()).forEach({npc => npc.morir()}) }
}

object vacio {
	method interaccion() { jugador.reemplazarObjeto(self) }
	
	method usar(){}
	
	method soltar(){}
	
	method serAgarrado() { jugador.objeto(self) }
}

class Veneno inherits Objeto (imageAux = "veneno"){
	var usos = 3
	
	method usar() {
		const aux = direcciones.cercanosA(jugador, 1,nivel.interactuables())
		if( aux.equals([]).negate() )
			self.envenenar(aux.head())
		usos -= 1
		if(usos.equals(0)) jugador.objeto(vacio)
	}
	
	method envenenar(npc){ game.schedule(5000, {npc.morir()}) }
}

object pizza inherits Objeto (imageAux = "pizza"){
	method usar() { }
}

class Bomba inherits Objeto (imageAux = "bomb"){
	method explosion(){
		nivel.quitar(self)
	}
	method usar() {
		self.soltar()
		// sonido y cambio de imagen pls, que sea un method para ambos asi podemos darle una imagen y sonido especial a cada tipo de bomba
		game.schedule(2000, {self.explosion()} )
	}
}


class BombaExplosiva inherits Bomba {
	override method explosion(){ 
		direcciones.cercanosA(self, 5,nivel.interactuables()+[jugador]).forEach({npc=>npc.explotar()})
		super()
	}
}

class BombaDeHumo inherits Bomba{
	override method explosion(){
		direcciones.cercanosA(self, 5,nivel.interactuables()+[jugador]).forEach({npc=>npc.efectoHumo()})
		super()}
		 	}