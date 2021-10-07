import wollok.game.*
import jugador.*
import civilNPC.*

class Objeto {
	const property esObjeto = true
	const property esInteractuable = false
	const property esNPC = false
	const property objetoAtravesable = true
	var property position = game.at(10,10) 
}

class Remera inherits Objeto {
	var property image = "remera.png"
	method usar(personaje) {
		personaje.cambiarRopa()
	}
}

object vacio inherits Objeto {
	method usar(personaje){}
}

class Veneno inherits Objeto {
	method image() = "veneno.png"
	method usar(personaje) {

	}
}

object pizza inherits Objeto {
	method image() = ".png"
	method usar(personaje) {

	}
}

class Bomba inherits Objeto {
	method image() = ".png"
	method usar(personaje) {

	}
}

class BombaDeHumo inherits Objeto {
	method image() = ".png"
	method usar(personaje) {

	}
}