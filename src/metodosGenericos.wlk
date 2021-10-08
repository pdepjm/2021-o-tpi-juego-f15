import wollok.game.*

object metodos{
	method repetirNVeces(intervalo, cantidad, accion) {
 		const nombreAleatorio = 0.randomUpTo(10).toString()
  		game.onTick(intervalo, nombreAleatorio, accion)
  		game.schedule(intervalo * cantidad, { game.removeTickEvent(nombreAleatorio) })
	}
	method numeroEntre(num,num2){
		return (num..num2).anyOne()
	}
	
}
