import wollok.game.*
import direcciones.*
object jugador{
	var property position = game.at(10,10)
	method image() = "jugadorfeo.png"
	method moverPara(direccion) {
		position = direccion.proximaPosicion(position) 
	}
	method usarCuchillo(){
		game.colliders(self).forEach{npc=>npc.morir()}
	}
}
	/*
	var objeto = null
	
	
	method agarrarObjeto(obj){
		objeto = obj
	}
	method usarObjeto(){
		objeto.usar(self)
	}
	method usarEntorno(trampa){
		trampa.accionar()
	}
	
	method moverPara(direccion) {
		posicion = direccion.proximaPosicion(posicion) 
	}
	
	method posicion(unaPosicion) {
		posicion = unaPosicion
	}
	
	*/
