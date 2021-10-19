import wollok.game.*
import metodosGenericos.*

class Pared{
	const property position = null
	const property esAtravesable = false
	var property image = "hud_gui/pared.png"
	method interaccion() {}
}

object horizontal{ 
	method construirPared(x,y) = { i => game.addVisual(new Pared(position = game.at(x+i,y))) }
}
object vertical{
	method construirPared(x,y) = { i => game.addVisual(new Pared(position = game.at(x,y+i))) }
}

object todasLasParedes{ // RECTANGULOS
	method cargar(){
	self.lineaPared(16,0,-1,vertical)
	self.lineaPared(9,2,15,vertical)
	self.lineaPared(7,24,0,vertical)
	self.lineaPared(9,24,9,vertical)
	self.lineaPared(3,24,20,vertical)
	self.lineaPared(7,48,16,vertical)
	self.lineaPared(6,34,17,vertical)
	self.lineaPared(6,33,17,vertical)
	self.lineaPared(3,33,9,vertical)
	self.lineaPared(3,33,4,vertical)
	self.lineaPared(3,34,9,vertical)
	self.lineaPared(3,34,4,vertical)
	self.lineaPared(13,45,3,vertical)
	self.lineaPared(4,31,-1,vertical)
	self.lineaPared(8,12,15,vertical)
	self.lineaPared(46,2,24,horizontal)
	self.lineaPared(24,0,0,horizontal)
	self.lineaPared(7,-1,15,horizontal)
	self.lineaPared(8,8,15,horizontal)
	self.lineaPared(5,18,15,horizontal)
	self.lineaPared(7,40,17,horizontal)
	self.lineaPared(6,32,17,horizontal)
	self.lineaPared(12,32,13,horizontal)
	self.lineaPared(14,30,4,horizontal)
	self.lineaPared(9,23,0,horizontal)
	self.lineaPared(2,24,4,horizontal)
	self.lineaPared(24,0,0,horizontal)
	}
	
	method lineaPared(cantidad,x,y,sentido){
		cantidad.times(sentido.construirPared(x,y))
	}
}