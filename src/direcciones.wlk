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
	const property listaDirecciones = #{abajoNpc, izquierdaNpc, arribaNpc, derechaNpc}
	
	method direccionRandom() {
		const aux = 0.randomUpTo(4).truncate(0)
		return listaDirecciones.asList().get(aux)
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