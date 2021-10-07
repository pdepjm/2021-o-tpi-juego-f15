import wollok.game.*

class Pared{
	const property position = null
	var property objetoAtravesable = false
	var property image = "blood.png"
}

object todasLasParedes{
	method cc(){
		game.addVisual(new Pared(position = game.at(5,5)))
	}
	

	method cargar(){
	10.times({i=>game.addVisual(new Pared(position = game.at(0,i)))})
	}
}