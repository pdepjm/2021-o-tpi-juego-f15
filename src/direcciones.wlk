import wollok.game.*
import paredes.*
import jugador.*
import civilNPC.*

object mover{
	method mov(sentido,player){
		player.imageFlip(sentido)
		if (self.condicionMovimiento(sentido,player)) return sentido.proximaPosicion(player.position()) else return player.position()
	}
	method condicionMovimiento(sentido,player) = game.getObjectsIn(sentido.proximaPosicion(player.position())).all({objeto=>objeto.objetoAtravesable()})
}

object direcciones {
	
	const property listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() {
		return listaDirecciones.anyOne()
	}
	
	method cosasCerca(sujeto){
    	return self.algoA(arriba, sujeto) + self.algoA(abajo, sujeto) + self.algoA(izquierda, sujeto) + self.algoA(derecha, sujeto) + game.colliders(sujeto)
    }
    
    method algoA(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.proximaPosicion(sujeto.position()))
    }
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