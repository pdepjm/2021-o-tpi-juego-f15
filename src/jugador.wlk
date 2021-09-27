import wollok.game.*

object jugador{
	
	var objeto = null
	var posicion = game.at(2,2)
	
	method agarrarObjeto(obj){
		objeto = obj
	}
	method usarObjeto(){
		objeto.usar(self)
	}
	method usarEntorno(trampa){
		trampa.accionar()
	}
	method usarCuchillo(personaCerca){
		personaCerca.morir()
	}
	
	method moverPara(direccion) {
		posicion = direccion.proximaPosicion(posicion) 
	}
	
	method posicion(unaPosicion) {
		posicion = unaPosicion
	}
	
	method position() {
		return posicion
	} 
}
