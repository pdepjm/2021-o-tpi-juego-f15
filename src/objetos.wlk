import wollok.game.*
import jugador.*

object vestido {
	var property position = game.at(0,0)
	method esObjeto() = true
	method image() = "vestido.png"
	method soltar(){
		self.position(jugador.position())
		game.addVisual(self)
	}
	method agarrar(){
		game.removeVisual(self)
	}
}/*sjfiasfinds */
object vacio {
	method esObjeto() = true
	method soltar(){
		
	}
	method agarrar(){
		
	}
	method porque(){
		
	}
}
