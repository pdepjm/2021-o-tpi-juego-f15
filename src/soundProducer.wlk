import wollok.game.*

// Utilizar este objeto para crear sonidos.
// NO utilizar directamente game.sound(audioFile) porque puede complicarles el testeo
// En su lugar utilicen: soundProducer.sound(audioFile)
// Si sus tests fallan porque les dice que no pueden iniciar sonidos antes de que empiece el juego
// lo que deben hacer es cambiar el proveedor del soundProducer, asi: soundProducer.provider(soundProviderMock)

object soundProducer {
	var provider = game
	var contador = 0
	
	method provider(_provider){
		provider = _provider
	}
	
	method sound(audioFile) = provider.sound(audioFile)
	
	method playMusic() {
		if ( contador == 0 ){ // Para que se ponga una cancion 1 sola vez, xq no encontre como parar canciones y si reinicias niveles se superponen las canciones
			if ( (0..1).anyOne() == 1 ){
				self.sound("sounds/She Meditates.mp3").play()
				contador += 1	
			}else{
				self.sound("sounds/Blizzard.mp3").play()
				contador += 1
			}
		}
	}
	
	method playVictory() { self.sound("sounds/Yeah Boii.mp3").play() }
	
	method horror() { self.sound("sounds/omae wa mou.mp3").play() }

	method muerte() { self.sound("sounds/Death Sound.mp3").play() }
	
	method smokeExplosion() { self.sound("sounds/smokeExplosion.mp3").play() }
	
	method explosionExplosion() { self.sound("sounds/explosiveExplosion.mp3").play() }
}

object soundProviderMock {
	method sound(audioFile) = soundMock
}

object soundMock {
	method pause(){}
	
	method paused() = true
	
	method play(){}
	
	method played() = true
	
	method resume(){}
	
	method shouldLoop(looping){}
	
	method shouldLoop() = false
	
	method stop(){}
	
	method volume(newVolume){}
	
	method volume() = 1
}