import wollok.game.*
import nivel.*
import pantallas.*

// ¡Los visuales también pueden ser texto!
// Hay que definir la posición en la que debe aparecer
// Y el texto que se debe mostrar. Para eso debe implementar el método text()
// el cual debe devolver un string
// Por defecto el color es azul, pero se puede modificar
// Para ello debe entender el mensaje textColor()
// El método debe devolver un string que represente el color
// Debe ser en un formato particular: tiene que ser un valor RGBA en hexa "rrggbbaa"
// Les dejamos algunos ejemplos
// ¡También se puede combinar con las imágenes!

object marcoContadorKills {
	method image() = "hud_gui/contador.png"
	method position() = game.at(42,1)
}

object contadorKills {
	const limite = 4
	var kills = 0
	
	method textColor() = paletaDeColores.blanco()
	
	method position() = game.at(44,1)
	
	method text() {
		if( kills.equals(limite) ){
			game.schedule(200, { pantallaDeVictoria.ganar() })
			kills = 0
		}
		return kills.toString() + " / " + limite.toString()
	}
	
	method subirKills() { kills += 1 }
}

object marcoContadorTiempo {
	method image() = "hud_gui/contador.png"
	method position() = game.at(40,1)
}

object contadorTiempo {
    var segundos = 0
    var minutos = 0
    var acumuladorTiempo = 0
    var property textColor = paletaDeColores.blanco()
    
    method text() = minutos.toString() + " : " + segundos.toString()
    method position() = game.at(42,1)
    
    method iniciar() { 
		segundos = 0
		minutos = 0
		acumuladorTiempo = 0
		game.onTick(1000, "updateTimer", { => self.update() })
}
    method update(){
        acumuladorTiempo += 1
        if(acumuladorTiempo<60){
            segundos += 1
            }
        if(acumuladorTiempo == 60){
            minutos += 1
            segundos = 0
            acumuladorTiempo = 0
        }
        self.text()
        if( minutos == 1){
        	textColor = paletaDeColores.rojo()
        }
        if( minutos == 1 and segundos == 30 ){
        	game.stop()
        }
    }
 }
 
 object paletaDeColores {
 	method blanco() = "FFFFFF"
 	method rojo() = "FF00FF"
 }