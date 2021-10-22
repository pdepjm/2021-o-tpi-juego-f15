import wollok.game.*
import jugador.*
import metodosGenericos.*
import objetos.*
import direcciones.*
import nivel.*

class Interactuable{
	const property esAtravesable = true
	var property position = game.at(0,0)
	const identidad = ""
	
	method image() = "interactuables/" + identidad + ".png"
	method morir(){}
	method serAgarrado(){}
}

class Escotilla inherits Interactuable (identidad = "trapdoor"){
	var property destino = null
	method interaccion(){ jugador.position(destino.position()) }
}

class Cadaver inherits Interactuable (identidad = "cadaver"){
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

class Escondite inherits Interactuable(identidad = "tacho"){
	
	method interaccion(){
		direcciones.cercanosA(jugador).forEach({cadaver =>
			nivel.quitar(cadaver)
			nivel.removerMuerto(cadaver)
		})
		game.addVisual(self)
	}
}

