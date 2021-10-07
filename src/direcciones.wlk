import wollok.game.*
import paredes.*
import jugador.*
import civilNPC.*

object mover{
	method mov(sentido,jugador){
		jugador.imageFlip(sentido)
		if (self.condicionMovimiento(sentido,jugador)) return sentido.proximaPosicion(jugador.position()) else return jugador.position()
	}
	method condicionMovimiento(sentido,jugador) = game.getObjectsIn(sentido.proximaPosicion(jugador.position())).all({objeto=>objeto.objetoAtravesable()})
}




object izquierda {
	method proximaPosicion(posicionActual) = posicionActual.left(1) 
}

object derecha {
	method proximaPosicion(posicionActual) = posicionActual.right(1) 
}

object arriba {
	method proximaPosicion(posicionActual) = posicionActual.up(1) 
}

object abajo {
	method proximaPosicion(posicionActual) = posicionActual.down(1) 
}







object direcciones {
	const property listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() {
		return listaDirecciones.anyOne()
	}
}



object izquierdaNpc {
	method proximaPosicion(posicionActual) = posicionActual.left(0.randomUpTo(2).truncate(0)) 
}

object derechaNpc {
	method proximaPosicion(posicionActual) = posicionActual.right(0.randomUpTo(2).truncate(0)) 
}

object arribaNpc {
	method proximaPosicion(posicionActual) = posicionActual.up(0.randomUpTo(2).truncate(0)) 
}

object abajoNpc {
	method proximaPosicion(posicionActual) = posicionActual.down(0.randomUpTo(2).truncate(0)) 
}