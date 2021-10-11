import wollok.game.*
import metodosGenericos.*

class Pared{
	const property position = null
	const property objetoAtravesable = false
	const property esObjeto = false
	const property esInteractuable = false
	const property esNPC = false	
	var property image = "pared.png"
}

object x{
	method crece(x,y) = {i => game.addVisual(new Pared(position = game.at(x+i,y)))}
}
object y{
	method crece(x,y) = {i => game.addVisual(new Pared(position = game.at(x,y+i)))}
}

object todasLasParedes{
	method cargar(){
	self.lineaPared(16,0,-1,y)
	self.lineaPared(9,2,15,y)
	self.lineaPared(7,24,0,y)
	self.lineaPared(9,24,9,y)
	self.lineaPared(3,24,20,y)
	self.lineaPared(7,48,16,y)
	self.lineaPared(6,34,17,y)
	self.lineaPared(6,33,17,y)
	self.lineaPared(3,33,9,y)
	self.lineaPared(3,33,4,y)
	self.lineaPared(3,34,9,y)
	self.lineaPared(3,34,4,y)
	self.lineaPared(13,45,3,y)
	self.lineaPared(4,31,-1,y)
	self.lineaPared(8,12,15,y)
	self.lineaPared(46,2,24,x)
	self.lineaPared(24,0,0,x)
	self.lineaPared(7,-1,15,x)
	self.lineaPared(8,8,15,x)
	self.lineaPared(5,18,15,x)
	self.lineaPared(7,40,17,x)
	self.lineaPared(6,32,17,x)
	self.lineaPared(12,32,13,x)
	self.lineaPared(14,30,4,x)
	self.lineaPared(9,23,0,x)
	self.lineaPared(2,24,4,x)
	self.lineaPared(24,0,0,x)
	}
	
	method lineaPared(cantidad,x,y,en){
		cantidad.times(en.crece(x,y))
	}
}