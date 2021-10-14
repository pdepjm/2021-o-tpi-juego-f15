import wollok.game.*
import jugador.*
import metodosGenericos.*
import objetos.*
import direcciones.*
import tipos.*

class Interactuable{
	const property objetoAtravesable = true
	var property position = null
	const property esInteractuable = true
	const property estaVivo = false
	const property esObjeto = false
	const property esNPC = false
}

class Escotilla inherits Interactuable{
	const property esCadaver = false
	var property image = "pared.png"
	var property destino = null
	method interaccion(){
		jugador.position(destino.position())
	}
}

class Cadaver inherits Interactuable {
	const property esCadaver = true
	var property image = "personajes/cadaver.png"
	var cargado = false
	var property ultimaPos = jugador.position().right(1)
	
	method interaccion(){
		if(cargado.equals(false)){
			cargado = true
		}else{
			cargado = false
			ultimaPos = jugador.position().right(1)
		}
	}
	
	override method position() {
		if(cargado)
			return jugador.position().right(1)
		else
			return ultimaPos
	}
}

class Escondite inherits Interactuable{
	const property esCadaver = false
	var property image = "interactuables/tacho.png"
	
	method interaccion(){
		direcciones.algoCerca(tipoCadaver,jugador).forEach({cadaver => game.removeVisual(cadaver)})
		}
}

