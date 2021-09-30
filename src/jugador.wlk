import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*

object jugador{
	var property position = game.at(24,0)
	var objeto = vacio
	method image() = "jugadorfeo.png"
	method moverPara(direccion) {
		if(nivel.paredes().contains(direccion.proximaPosicion(position)).negate()){
			position = direccion.proximaPosicion(position)
		}
	}
	method usarCuchillo(){
		self.objetosCerca().forEach({npc => npc.morir()})

	}
	method objetosCerca() = game.colliders(self)
	method agarrarObjeto(){
		objeto.soltar()
		objeto = self.objetosCerca().findOrElse({obj=> obj.esObjeto() && obj != objeto},{vacio})
		objeto.agarrar()
	}
	
}
	/*
	 * .addAll(game.getObjectsIn(self.position().right(1)).addAll(game.getObjectsIn(self.position().left(1))).addAll(game.getObjectsIn(self.position().down(1))).addAll(game.getObjectsIn(self.position().up(1))).addAll(game.getObjectsIn(self.position().right(1).up(1))).addAll(game.getObjectsIn(self.position().right(1).down(1))).addAll(game.getObjectsIn(self.position().left(1).up(1))).addAll(game.getObjectsIn(self.position().left(1).down(1)))
	 * .addAll(game.getObjectsIn(self.position().right(1))).addAll(game.getObjectsIn(self.position().left(1))).addAll(game.getObjectsIn(self.position().down(1))).addAll(game.getObjectsIn(self.position().up(1))).addAll(game.getObjectsIn(self.position().right(1).up(1))).addAll(game.getObjectsIn(self.position().right(1).down(1))).addAll(game.getObjectsIn(self.position().left(1).up(1))).addAll(game.getObjectsIn(self.position().left(1).down(1)))
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
