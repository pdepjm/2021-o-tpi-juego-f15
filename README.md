# Fiesta Dura
## Equipo de desarrollo
---

- Basile, Bautista - @bautibasileutn
- Buffoni, Julian - @JulianBuffoni
- Demattei, Santiago - @SantiagoDemattei
- Ingratta, Daniela - @daniingratta
- Solari Parravicini, Joaquin - @jsolarip
- Torales, Pedro Imanol - @PedroTorales
## Capturas
---

- Pantalla de Carga
![pantallaDeCarga](https://imgur.com/RbzasyD.png)

- Gameplay 4K HDR
![gameplay](https://imgur.com/R9yyIs1.png)

- Pantalla de Victoria
![pantallaDeVictoria](https://imgur.com/umRjuwJ.png)

## Reglas de Juego / Instrucciones
---

|INSTRUCCIONES               |            |
|---------------|------------|
|Movimiento     | w, a, s, d |
|Usar Cuchillo  |     r      |
|Agarrar Objeto |     e      |
|Soltar Objeto  |     q      |
|Usar Objeto    |     f      |
|Usar Escotilla |     g      |
|               |            |

**REGLAS**

Nuestro protagonista no soporta la música en la madrugada, los borrachos, las drogas, los vecinos que no pueden dormir…

Algo hace clic en su cabeza y entra a la accion: "el que no respira no molesta".
El objetivo del jugador es intentar matar a todas las personas de la fiesta con la mayor discreción a fin de que la policía no lo atrape, todo esto, dentro de un lapso de 90 segundos.

Para *silenciar* a los jóvenes el jugador podra utilizar un cuchillo (que siempre tiene a disposicion) u otros objetos que encuentre en el lugar. Ademas, para desplazarse con mayor rapidez puede hacer uso de escotillas, que le permiten moverse intantanseamente entre 2 posiciones del mapa.
## Respuestas teóricas
---

1. **Polimorfismo**: ¿Cuál es el mensaje polimórfico? ¿Qué objetos lo implementan? ¿Qué objeto se aprovecha de ello?

```wollok
objeto.usar()
```

Los objetos que pertenecen a la clase "*Objeto*" son los que entienden el mensaje, y es el objeto "*jugador*" el que interactua con ellos indistintamente de cual de ellos se trate.
**COMPLETAR**

---
2. **Colecciones**: ¿Qué operaciones de colecciones se utilizan? ¿Usaron mensajes con y sin efecto? ¿Para qué?

|Operaciones|Efecto/Consulta|
|-----------|---------------|
|forEach    |Efecto         |
|anyOne     |Consulta       |
|filter     |Consulta       |
|add        |Efecto         |
|remove     |Efecto         |
|head       |Consulta       |
|           |               |
**COMPLETAR**

Se hace uso de "*forEach*" para ...
"*anyOne*" es utilizado para elegir de forma aleatoria un numero para poder **COMPLETAR**
"*head*" es utilizado con el fin de **COMPLETAR**
"*add*" y "*remove*" son utilizados, por ejemplo, para **COMPLETAR**
"*filter*"

3. **Clases**: ¿Usan clases? ¿Por qué? ¿Dónde o cuándo se instancian los objetos?

    Definimos la clase "*Civil*", que se instancia en "*nivel*" en la configuracion inicial del nivel para agregar multiples objetivos que tenemos que asesinar.

4. **Herencia**: ¿Entre quiénes y por qué? ¿Qué comportamiento es común y cuál distinto?

    Definimos la clase "*Objeto*" para poder codear una unica vez los atributos que definen a un "*objeto*", en vez de hacerlo para cada "*objeto*" en particular.
    Los "*objetos*" se instancian en la configuracion inicial del nivel, luego de salir de la pantalla de carga.

    Los "*objetos*" pertenecientes a la clase comparten los siguientes atributos / metodos:
    ```wollok
    property esObjeto
    property esInteractuable
    property esNPC
    property objetoAtravesable
    property position
    ```
    Sin embargo, cada "*objeto*" posee un metodo "*usar()*" propio, ya que cada uno de ellos debe reaccionar de manera diferente.

5. **Composición**: ¿Qué objetos interactúan? ¿Dónde se delega? ¿Por qué no herencia?

"*Bomba*" hace uso de la composicion e interactua con "*explosiva*" y "*humo*" mediante el atributo "*tipo*". **COMPLETAR**

## Diagrams

**DIAGRAMA MAS REDUCIDO**

![Diagrama]()