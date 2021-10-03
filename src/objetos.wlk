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


