import wollok.game.*
import jugador.*

class Trampa{
	var property objetoAtravesable = true
	var property image = "pared.png"
	const property esInteractuable = true
	var property position = game.at(0,0)
	var property destino = null
	method interactuar(){
		jugador.position(destino.position())
	}
}
