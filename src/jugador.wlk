import wollok.game.*

object jugador{
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
	method usarCuchillo(personaCerca){
		personaCerca.morir()
	}
	
	
	
	
	method position() {
		return posicion
	} 
}
