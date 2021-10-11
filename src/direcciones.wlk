import wollok.game.*
import paredes.*
import jugador.*
import civilNPC.*
import radios.*

object movimiento{
	method mover(sentido,player){
		player.imageFlip(sentido)
		if (self.condicionMovimiento(sentido,player)) 
			return sentido.proximaPosicion(player.position()) 
		else 
			return player.position()
	}
	
	method condicionMovimiento(sentido,player) = game.getObjectsIn(sentido.proximaPosicion(player.position())).all({objeto=>objeto.objetoAtravesable()})
}

object direcciones {
	
	const property listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() = listaDirecciones.anyOne()
    method algoCerca(tipo,persona) = radio.radio1(persona).filter({obj => tipo.es(obj)})
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