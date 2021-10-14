import wollok.game.*
import paredes.*
import jugador.*
import NPCs.*
import radios.*
import objetos.*
import nivel.*

object movimiento{
	method mover(sentido,player){
		if (self.condicionMovimiento(sentido,player)) 
			return sentido.proximaPosicion(player.position())
		else 
			return player.position()
	}
	
	method condicionMovimiento(sentido, player) = game.getObjectsIn(sentido.proximaPosicion(player.position())).all({auxiliar => auxiliar.objetoAtravesable()})
}	// MAL NOMBRE - EXPRESIVIDAD | posible cambio de nombre de: objetoAtravesable a esAtravesable

object direcciones {
	const property listaDirecciones = [izquierda,derecha,arriba,abajo]
	
	method direccionRandom() = listaDirecciones.anyOne()
	
    //method algoCerca(tipo, persona) = radio.radio1(persona).filter({auxiliar => tipo.es(auxiliar)})
	method algoCerca(tipo, persona) { // esto funca y no necesitamos usar radio, pero algunos objetos no entienden el objeto morir, hay que ver como hacerlo mas polimorfico
		const position = persona.position()
		return nivel.objetos2().filter({ aux => position.distance(aux.position()) < 2 })
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