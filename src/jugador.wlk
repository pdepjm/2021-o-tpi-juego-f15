import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*

object jugador inherits SerVivo (identidad = "player"){
	var property position = game.at(28,2)
	var property objeto = vacio
	const property esNPC = false

	method inicializar() {
		objeto = vacio
		position = game.at(28,2)
		sentido = abajo
		self.imageAux("default")
	}

	method interactuar(){
		(direcciones.cercanosA(self)+[vacio]).head().interaccion()
	}
	method moverPara(direccion){
			position = movimiento.mover(direccion,self)
			self.sentido(direccion)
	}
    
	method reemplazarObjeto(ob){
		objeto.soltar()
		ob.serAgarrado()
	}

    method usarObjeto() {
    	objeto.usar()
    }
    
    method cambiarRopa() {
    		self.imageAux("vestido")
    }
    
    method estaVestido() = self.imageAux() == "vestido"
}