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

object izquierda {
	method proximaPosicion(posicionActual) = posicionActual.left(1) 
	method rangoDeDos(posicionActual) = posicionActual.left(2)
}

object derecha {
	method proximaPosicion(posicionActual) = posicionActual.right(1) 
	method rangoDeDos(posicionActual) = posicionActual.right(2)
}

object arriba {
	method proximaPosicion(posicionActual) = posicionActual.up(1) 
	method rangoDeDos(posicionActual) = posicionActual.up(2)
	
}

object abajo {
	method proximaPosicion(posicionActual) = posicionActual.down(1) 
	method rangoDeDos(posicionActual) = posicionActual.down(2)
}

object direcciones {
	
	const property listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() {
		return listaDirecciones.anyOne()
	}
	
	method cosasCerca(sujeto){
    	return self.algoArriba(arriba, sujeto) + self.algoAbajo(abajo, sujeto) + self.algoALaIzquierda(izquierda, sujeto) + self.algoALaDerecha(derecha, sujeto)
    }
    
    method algoArriba(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeDos(sujeto.position()))
    }
    
    method algoAbajo(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeDos(sujeto.position()))
    }
    method algoALaIzquierda(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeDos(sujeto.position()))
    }
    method algoALaDerecha(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeDos(sujeto.position()))
    }
	
}