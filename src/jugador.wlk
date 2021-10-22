import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import NPCs.*
import metodosGenericos.*

object jugador inherits SerVivo (identidad = "player", position = game.at(28,2)){
	var property objeto = vacio

	method inicializar() {
		objeto = vacio
		position = game.at(28,2)
		sentido = abajo
		self.imageAux("default")
	}

	method interactuar(){
		game.schedule(0, {(direcciones.cercanosA(self) + [vacio]).head().interaccion()}) //no tiene sentido pero sino da error los test
	}
	
	method moverPara(direccion){
			position = movimiento.mover(direccion,self)
			self.sentido(direccion)
	}
    
	method reemplazarObjeto(ob){
		objeto.soltar()
		ob.serAgarrado()
	}

    method usarObjeto() { objeto.usar() }
    
    method cambiarRopa() { self.imageAux("vestido") }
    
    method estaVestido() = self.imageAux() == "vestido"
}