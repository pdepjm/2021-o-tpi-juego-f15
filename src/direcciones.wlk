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
    	return self.algoArriba(arriba, sujeto) + self.algoAbajo(abajo, sujeto) + self.algoALaIzquierda(izquierda, sujeto) + self.algoALaDerecha(derecha, sujeto)
    }
    
    method algoArriba(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeUno(sujeto.position()))
    }
    
    method algoAbajo(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeUno(sujeto.position()))
    }
    
    method algoALaIzquierda(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeUno(sujeto.position()))
    }
    
    method algoALaDerecha(orientacion, sujeto){
    	return game.getObjectsIn(orientacion.rangoDeUno(sujeto.position()))
    }
}

object izquierda {
	method proximaPosicion(posicionActual) = posicionActual.left(1) 
	method rangoDeUno(posicionActual) = posicionActual.left(1)
}

object derecha {
	method proximaPosicion(posicionActual) = posicionActual.right(1) 
	method rangoDeUno(posicionActual) = posicionActual.right(1)
}

object arriba {
	method proximaPosicion(posicionActual) = posicionActual.up(1) 
	method rangoDeUno(posicionActual) = posicionActual.up(1)
	
}

object abajo {
	method proximaPosicion(posicionActual) = posicionActual.down(1) 
	method rangoDeUno(posicionActual) = posicionActual.down(1)
}