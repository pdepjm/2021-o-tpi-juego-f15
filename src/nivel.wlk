import wollok.game.*
import jugador.*
import civilNPC.*
import policiaNPC.*


object nivel{
	const npc1 = new civil()
	const npc2 = new civil()
	const npc3 = new civil()
	const npc4 = new civil()
	
	method configuracionInicial(){
		game.addVisual(jugador)
		game.addVisual(npc1)
		game.addVisual(npc2)
		game.addVisual(npc3)
		game.addVisual(npc4)
		self.configurarTeclas()
	}
	
	method configurarTeclas(){
		// FALTA CONFIGURAR EL MANTENER APRETADO LAS TECLAS (whenKeyPressedDo)
		keyboard.a().onPressDo({ jugador.moverPara(izquierda) })
		keyboard.d().onPressDo({ jugador.moverPara(derecha) })
		keyboard.w().onPressDo({ jugador.moverPara(arriba) })
		keyboard.s().onPressDo({ jugador.moverPara(abajo) })
		
		keyboard.j().onPressDo({ jugador.usarObjeto() })
	}
}
