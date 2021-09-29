import wollok.game.*
import direcciones.*
object jugador{
	var property position = game.at(10,10)
	var objeto = null
	method image() = "jugadorfeo.png"
	method moverPara(direccion) {
		position = direccion.proximaPosicion(position) 
	}
	method usarCuchillo(){
		self.objetosCerca().forEach{npc=>npc.morir()}

	}
	method objetosCerca() = game.colliders(self).addAll(game.getObjectsIn(self.position().right(1))).addAll(game.getObjectsIn(self.position().left(1))).addAll(game.getObjectsIn(self.position().down(1))).addAll(game.getObjectsIn(self.position().up(1))).addAll(game.getObjectsIn(self.position().right(1).up(1))).addAll(game.getObjectsIn(self.position().right(1).down(1))).addAll(game.getObjectsIn(self.position().left(1).up(1))).addAll(game.getObjectsIn(self.position().left(1).down(1)))
	method agarrarObjeto(){
		objeto.soltar()
		objeto = self.objetosCerca().find{obj=>obj.esObjeto() == true}
		objeto.agarrar()
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
