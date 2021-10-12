import wollok.game.*
import jugador.*
import NPCs.*
import metodosGenericos.*

class Objeto {
	const property esObjeto = true
	const property esInteractuable = false
	const property esNPC = false
	const property objetoAtravesable = true
	var property position = game.at(10,10) 
}

class Remera inherits Objeto {
	var property image = "objetos/remera.png"
	method usar(personaje) {
		personaje.cambiarRopa()
	}
}

object vacio inherits Objeto {
	method usar(personaje){}
}

class Veneno inherits Objeto {
	method image() = "objetos/veneno.png"
	method usar(personaje) {

	}
}

object pizza inherits Objeto {
	method image() = "objetos/.png"
	method usar(personaje) {

	}
}

class Bomba inherits Objeto {
	method image() = "objetos/bomb.png"
	method usar(personaje) {
		position = personaje.position()
	//	game.schedule(2000, self.explotar(personaje.position()) )
	}
	method explotar(posicion){
	}
}

class BombaDeHumo inherits Objeto {
	method image() = "objetos/.png"
	method usar(personaje) {

	}
}