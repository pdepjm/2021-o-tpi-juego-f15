import wollok.game.*
import pantallaDeCarga.*


//todo esto al final no lo usamos 

object backroundCarga {
	method image() = "Backround3.png"
	method position() = game.at(0,0)
}

object mensajeCarga {
	method image() = "message.png"
	method position() = game.center()
}

object fondoJuego {
	method image() = "mapa.png"
	method position() = game.at(0,0)
}

