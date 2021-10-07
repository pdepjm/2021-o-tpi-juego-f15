import wollok.game.*
import jugador.*
import civilNPC.*

class Objeto {
	method esObjeto() = true
	method esInteractuable() = false
	method esNPC() = false
}

object vestido inherits Objeto {
	var property objetoAtravesable = true
	var property position = game.at(10,10) 
	
	method image() = "vestido.png"
	
	method usar(personaje) {
		personaje.cambiarRopa()
	}
}

object vacio inherits Objeto {
	
	method usar(personaje){}
}

object veneno inherits Objeto {
	var property objetoAtravesable = true
	
	var property position = game.at(15,5) 
	
	method image() = "veneno.png"
	
	method usar(personaje) {

	}
}

object pizza inherits Objeto {
	var property position = game.at(25,5) 
	
	method image() = ".png"
	
	method usar(personaje) {

	}
}

object bomba inherits Objeto {
	var property position = game.at(30,5) 
	
	method image() = ".png"
	
	method usar(personaje) {

	}
}

object bombaDeHumo inherits Objeto {
	var property position = game.at(10,5) 
	
	method image() = ".png"
	
	method usar(personaje) {

	}
}