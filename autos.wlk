object dominic{
    const autos= []

    method comprarOConseguirAuto(unAuto) {
        autos.add(unAuto)
    }

    method autosNoEnCondiciones() = autos.filter({auto => not auto.enCondiciones()})    

    method enCondiciones() = autos.filter({auto => auto.enCondiciones()})

    method mandarAutosAlTaller(listaDeAutos) {
        taller.recibirAutos(self.autosNoEnCondiciones())
    }

    method hacerPruebaDeVelocidad() {
        autos.forEach({auto => auto.hacerPrueba()})
    }

    method venderAutos() {
        autos.clear()
    }

    method promedioDeVelocidad() = autos.sum({auto => auto.velocidadMaxima()}) / autos.size()

    method autoMasRapido() = self.enCondiciones().max({auto => auto.velocidadMaxima()})

    method hayUnAutoMuyVeloz() = self.autoMasRapido().velocidadMaxima() > 2 * self.promedioDeVelocidad()
}

object taller{
    const autosAReparar = []

    method recibirAutos(listaDeAutos) {
        autosAReparar.addAll(listaDeAutos)
    }

    method repararAutos() {
        autosAReparar.forEach({auto => auto.reparar()})
        autosAReparar.clear()
    }

    
}

//autos
object laFerrari {
    var estadoDelMotor = 87
    method velocidadMaxima() = 110 + if(estadoDelMotor > 75) 15 else 0

    method enCondiciones()= estadoDelMotor > 65

    method reparar() {
        estadoDelMotor = 100
    }

    method hacerPrueba() {
        estadoDelMotor =- 30.max(0)
    }
}
object flechaRubi {
    var litrosDeCombustible = 100
    var property combustible = gasolina
    var color = azul

    method velocidadMaxima() = litrosDeCombustible * 2 + combustible.calculo(litrosDeCombustible)

    method cambiarCombustible(tipoDeCombustible) {
        combustible = tipoDeCombustible
    }

    method enCondiciones() = 
        litrosDeCombustible > combustible.nivelMinimo() && color == rojo

    method reparar() {
        litrosDeCombustible = litrosDeCombustible * 2
        color.cambiarColor()
    }

    method hacerPrueba() {
        combustible =- 5
    }
}
object elIntocable {
    var property enCondiciones = true

    method hacerPrueba() {
        enCondiciones = false
    }

    method reparar() {
        enCondiciones = true
    }

    method velocidadMaxima() = 45
}

object dodgeCharger {
    var estadoDelMotor = 90
    var property combustible = nitrogenoLiquido
    method velocidadMaxima() = 180 + if(combustible == nitrogenoLiquido) 20 else 0
    var color = negro

    method enCondiciones()= estadoDelMotor > 50 && color == negro

    method reparar() {
        estadoDelMotor += (estadoDelMotor * 1.5).min(100)
        color = negro
    }

    method hacerPrueba() {
        estadoDelMotor =- 5
        color.cambiarColor()
    }
}

//combustibles
object gasolina {
    method nivelMinimo() = 85
    method calculo(litrosDeCombustible) = 10
}
object nafta {
    method nivelMinimo() = 50
    method calculo(litrosDeCombustible) = -1 * ((litrosDeCombustible * 2) / 10)
}
object nitrogenoLiquido {
    method nivelMinimo() = 0
    method calculo(litrosDeCombustible) = (litrosDeCombustible * 2) * 10
}

//colores
object azul {
    method cambiarColor() = verde
}
object verde {
    method cambiarColor() = rojo
}
object rojo {
    method cambiarColor() = rosa
}
object rosa {
    method cambiarColor() = negro
}
object negro {
    method cambiarColor() = azul
}