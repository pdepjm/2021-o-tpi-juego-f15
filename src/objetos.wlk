import wollok.game.*
import jugador.*
import NPCs.*
import metodosGenericos.*
import direcciones.*
import tipos.*

class Objeto {
	const property esObjeto = true
	const property esInteractuable = false
	const property esNPC = false
	const property objetoAtravesable = true
	const property esCadaver = false
	var property position = game.at(10,10)
	const imageAux
	
	method image() = "objetos/" + imageAux + ".png"

	method interaccion() {}
}

class Remera inherits Objeto (imageAux = "remera"){
	method usar() {
		jugador.cambiarRopa()
		jugador.objeto(vacio)
	}
}

object vacio {
	method usar(){}
}

class Veneno inherits Objeto (imageAux = "veneno"){
	var usos = 1
	
	method usar() {
		const aux = direcciones.algoCerca(jugador)
		if(aux.equals([]).negate()){
			self.envenenar(aux.head())
		}
		usos -= 1
		if(usos.equals(0)) jugador.objeto(vacio)
	}
	method envenenar(npc){
		game.schedule(5000, {npc.morir()})
	}
}

object pizza inherits Objeto (imageAux = "pizza"){
	method usar() {

	}
}

class Bomba inherits Objeto (imageAux = "bomb"){
	method usar() {
		position = jugador.position()
	//	game.schedule(2000, self.explotar(personaje.position()) )
	}
	method explotar(posicion){
	}
}

class BombaDeHumo inherits Objeto (imageAux = ""){
	method usar() {

	}
}