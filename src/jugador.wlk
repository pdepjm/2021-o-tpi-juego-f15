import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*

object jugador{
	var property position = game.at(0,0)
	var objeto = vacio
	method image() = "jugadorfeo.png"
	method moverPara(direccion) {
		if(nivel.paredes().contains(direccion.proximaPosicion(position)).negate()){
			position = direccion.proximaPosicion(position)
		}
	}
	method usarCuchillo(){
		self.npcCerca().forEach({npc => npc.morir()})

	}
	method objetosCerca() = game.colliders(self).filter({obj => obj.esObjeto()})
    method npcCerca() = game.colliders(self).filter({npc => npc.esObjeto().negate()})
	method agarrarObjeto(){
		if(objeto == vacio){
        objeto = self.objetosCerca().findOrElse({obj => obj.esObjeto() && obj != objeto}, {vacio})
        if(objeto != vacio){
        	game.removeVisual(objeto)
        }
        }
    }
    method soltarObjeto(){
    	if(objeto != vacio){
        objeto.position(position)
        game.addVisual(objeto)
        }
        objeto = vacio
    }
    


	// method estaCercaDe(cosa) = (cosa.position() * self.position()) == 1
	
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
