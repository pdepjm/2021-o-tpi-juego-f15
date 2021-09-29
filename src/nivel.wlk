import wollok.game.*
import objetos.*
import jugador.*
import civilNPC.*
import direcciones.*


object nivel{
	const npc1 = new Civil()
	const npc2 = new Civil()
	const npc3 = new Civil()
	const npc4 = new Civil()
	
	method configuracionInicial(){
		game.addVisual(vestido)
		game.addVisual(npc1)
		game.addVisual(jugador)
		self.configurarTeclas()
	}
	
	method configurarTeclas(){
		// FALTA CONFIGURAR EL MANTENER APRETADO LAS TECLAS (whenKeyPressedDo)
		keyboard.a().onPressDo({ jugador.moverPara(izquierda) })
		keyboard.d().onPressDo({ jugador.moverPara(derecha) })
		keyboard.w().onPressDo({ jugador.moverPara(arriba) })
		keyboard.s().onPressDo({ jugador.moverPara(abajo) })
		keyboard.e().onPressDo({ jugador.usarCuchillo() })
		keyboard.r().onPressDo({ jugador.agarrarObjeto() })
	}
}
