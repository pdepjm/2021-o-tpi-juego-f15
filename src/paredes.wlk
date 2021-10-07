import wollok.game.*

class Pared{
	const property position = null
	var property objetoAtravesable = false
	var property image = "pared.png"
}

object todasLasParedes{
	method cargar(){
	16.times({i=>game.addVisual(new Pared(position = game.at(0,-1+i)))})
	24.times({i=>game.addVisual(new Pared(position = game.at(i,0)))})
	9.times({i=>game.addVisual(new Pared(position = game.at(2,15+i)))})
	46.times({i=>game.addVisual(new Pared(position = game.at(2+i,24)))})
	7.times({i=>game.addVisual(new Pared(position = game.at(24,i)))})
	9.times({i=>game.addVisual(new Pared(position = game.at(24,9+i)))})
	3.times({i=>game.addVisual(new Pared(position = game.at(24,20+i)))})
	7.times({i=>game.addVisual(new Pared(position = game.at(-1+i,15)))})
	8.times({i=>game.addVisual(new Pared(position = game.at(8+i,15)))})
	5.times({i=>game.addVisual(new Pared(position = game.at(18+i,15)))})
	7.times({i=>game.addVisual(new Pared(position = game.at(48,16+i)))})
	7.times({i=>game.addVisual(new Pared(position = game.at(40+i,17)))})
	6.times({i=>game.addVisual(new Pared(position = game.at(32+i,17)))})
	12.times({i=>game.addVisual(new Pared(position = game.at(32+i,13)))})
	6.times({i=>game.addVisual(new Pared(position = game.at(34,17+i)))})
	6.times({i=>game.addVisual(new Pared(position = game.at(33,17+i)))})
	3.times({i=>game.addVisual(new Pared(position = game.at(33,9+i)))})
	3.times({i=>game.addVisual(new Pared(position = game.at(33,4+i)))})
	3.times({i=>game.addVisual(new Pared(position = game.at(34,9+i)))})
	3.times({i=>game.addVisual(new Pared(position = game.at(34,4+i)))})
	13.times({i=>game.addVisual(new Pared(position = game.at(45,3+i)))})
	14.times({i=>game.addVisual(new Pared(position = game.at(30+i,4)))})
	4.times({i=>game.addVisual(new Pared(position = game.at(31,-1+i)))})
	9.times({i=>game.addVisual(new Pared(position = game.at(23+i,0)))})
	2.times({i=>game.addVisual(new Pared(position = game.at(24+i,4)))})
	8.times({i=>game.addVisual(new Pared(position = game.at(12,24+i)))})
	}
	
}