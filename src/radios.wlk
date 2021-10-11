import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*
import tipos.*

object radio {
	var position = game.at(0,0)
	method radio1(objeto){
		position = objeto.position()
		return ([arriba,abajo,izquierda,derecha]).flatMap({dir=> game.getObjectsIn(dir.proximaPosicion(position))}) + [abajo,arriba].flatMap({dir=>game.getObjectsIn(dir.proximaPosicion(izquierda.proximaPosicion(position))) + game.getObjectsIn(dir.proximaPosicion(derecha.proximaPosicion(position))) }) + game.colliders(objeto)
		}
}