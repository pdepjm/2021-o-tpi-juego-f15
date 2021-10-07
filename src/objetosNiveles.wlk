import wollok.game.*
import pantallaDeCarga.*


//todo esto al final no lo usamos 

object backroundCarga {
	method image() = "backround.png"
	
	method position() = game.origin()
}

object mensajeCarga {
	method image() = "message.png"
	
	method position() = game.at(10,2)
}