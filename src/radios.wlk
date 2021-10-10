import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*
import metodosGenericos.*
import tipos.*

object radio {
	var pos = game.at(0,0)
	method radio1(ob){
		pos = ob.position()
		return ([arriba,abajo,izquierda,derecha]).flatMap({dir=> game.getObjectsIn(dir.proximaPosicion(pos))}) + [abajo,arriba].flatMap({dir=>game.getObjectsIn(dir.proximaPosicion(izquierda.proximaPosicion(pos))) + game.getObjectsIn(dir.proximaPosicion(derecha.proximaPosicion(pos))) }) +game.colliders(ob)
		}
}