import wollok.game.*
import paredes.*
import jugador.*
import NPCs.*
import objetos.*
import nivel.*

object movimiento{
	method mover(sentido,player){
		if (self.proxEsAtravesable(sentido,player)) 
			return sentido.proximaPosicion(player.position())
		else 
			return player.position()
	}
	
	method proxEsAtravesable(sentido, player) = game.getObjectsIn(sentido.proximaPosicion(player.position())).all({auxiliar => auxiliar.esAtravesable()})
}	

object direcciones {
	const listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() = listaDirecciones.anyOne()
	
	method cercanosA(persona) { // esto funca y no necesitamos usar radio, pero algunos objetos no entienden el objeto morir, hay que ver como hacerlo mas polimorfico
		return nivel.interactuables().filter({ aux => persona.position().distance(aux.position()) <= 1 })
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