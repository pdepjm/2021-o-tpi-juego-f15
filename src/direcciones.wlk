import wollok.game.*
import paredes.*
import jugador.*
import NPCs.*
import radios.*
import objetos.*

object movimiento{
	method mover(sentido,player){
		player.imageFlip(sentido)
		if (self.condicionMovimiento(sentido,player)) 
			return sentido.proximaPosicion(player.position()) 
		else 
			return player.position()
	}
	
	method condicionMovimiento(sentido, player) = game.getObjectsIn(sentido.proximaPosicion(player.position())).all({auxiliar => auxiliar.objetoAtravesable()})
}

object direcciones {
	const property listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() = listaDirecciones.anyOne()
	
    method algoCerca(tipo, persona) = radio.radio1(persona).filter({auxiliar => tipo.es(auxiliar)})
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