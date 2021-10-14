import wollok.game.*
import jugador.*
import metodosGenericos.*
import objetos.*
import direcciones.*
import tipos.*

class Interactuable{
	const property objetoAtravesable = true
	var property position = game.at(0,0)
	const property esInteractuable = true
	const property estaVivo = false
	const property esObjeto = false
	const property esNPC = false
	const property esCadaver = false
	const imageAux = ""
	
	method image() = "interactuables/" + imageAux + ".png"
}

class Escotilla inherits Interactuable(imageAux = "trapdoor"){
	var property destino = null
	method interaccion(){
		jugador.position(destino.position())
	}
	
}

class Cadaver inherits Interactuable (esCadaver = true, imageAux = "cadaver"){
	var cargado = false // delegar a obj
	var property ultimaPos = jugador.position().right(1)
	
	method interaccion(){
		if(cargado.negate()){
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

class Escondite inherits Interactuable(imageAux = "tacho"){
	
	method interaccion(){
		direcciones.algoCerca(jugador).forEach({cadaver => game.removeVisual(cadaver)})
		}
}

