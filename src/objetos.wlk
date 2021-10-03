import wollok.game.*
import jugador.*
import civilNPC.*

object vestido {
	var property position = game.at(10,10) 
	
	method esObjeto() = true
	
	method image() = "vestido.png"
	
	method usar(personaje) {
		personaje.cambiarRopa()
	}
}

object vacio {
	method esObjeto() = true
	method usar(personaje){}
}

object veneno {
	var property position = game.at(10,5) 
	
	method esObjeto() = true
	
	method image() = "veneno.png"
	
	method usar(personaje) {

	}
}