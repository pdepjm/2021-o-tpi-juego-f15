import wollok.game.*
import direcciones.*
import objetos.*
import nivel.*
import civilNPC.*

object jugador{
	var property position = game.at(0,0)
	var objeto = vacio //cada jugador tiene un objeto, arranca con vacio
	var property image = "jugadorfeo.png"
	
	method moverPara(direccion) {
		if(nivel.paredes().contains(direccion.proximaPosicion(position)).negate()){ 
			position = direccion.proximaPosicion(position)
		}
		self.imageFlip(direccion)
	}
	method imageFlip(direccion){
		if(direccion.equals(izquierda)){
			image = "jugadorfeo2.png"
		}
		if(direccion.equals(derecha)){
			image = "jugadorfeo.png"
		}
	}
	method usarCuchillo(){ self.npcCerca().forEach({npc => npc.morir()}) }
	
	method objetosCerca() = game.colliders(self).filter({obj => obj.esObjeto()}) // lista con los objetos que tiene cerca
	
    method npcCerca() = game.colliders(self).filter({npc => npc.esObjeto().negate()}) // lista con los npc que tiene cerca
    
	method agarrarObjeto(){
		if( objeto.equals(vacio) ){
        objeto = self.objetosCerca().findOrElse({obj => obj.esObjeto() && obj != objeto}, {vacio})
        if( objeto.equals(vacio).negate() ){
        	game.removeVisual(objeto)
        }
        }
    }
    method soltarObjeto(){
    	if( objeto.equals(vacio).negate() ){
        objeto.position(position)
        game.addVisual(objeto)
        }
        objeto = vacio
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
