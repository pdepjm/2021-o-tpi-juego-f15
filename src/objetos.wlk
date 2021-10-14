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
}

class Remera inherits Objeto {
	var property image = "objetos/remera.png"
	method usar() {
		jugador.cambiarRopa()
		jugador.objeto(vacio)
	}
}

object vacio {
	method usar(){}
}

class Veneno inherits Objeto {
	var usos = 3
	method image() = "objetos/veneno.png"
	method usar() {
		const aux = direcciones.algoCerca(tipoNpc,jugador)
		if(aux.equals([]).negate()){
			self.envenenar(aux.head())
		}
		usos = usos - 1
		if(usos.equals(0)) jugador.objeto(vacio)
	}
	method envenenar(npc){
		game.schedule(5000, {npc.morir()})
	}
}

object pizza inherits Objeto {
	method image() = "objetos/.png"
	method usar() {

	}
}

class Bomba inherits Objeto {
	method image() = "objetos/bomb.png"
	method usar() {
		position = jugador.position()
	//	game.schedule(2000, self.explotar(personaje.position()) )
	}
	method explotar(posicion){
	}
}

class BombaDeHumo inherits Objeto {
	method image() = "objetos/.png"
	method usar() {

	}
}