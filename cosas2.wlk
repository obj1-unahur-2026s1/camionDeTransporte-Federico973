object knightRader{
    method esCargado() {}
    method bulto() = 1
    method peso() = 500
    method nivelDePeligrosidad() = 10
}
object bumblebee{
    var formaActual = auto

    method esCargado() {formaActual = robot}
    method bulto() = 2
    method peso() = 800
    method nivelDePeligrosidad() = formaActual.nivel()
    method cambiarForma(otraForma){ formaActual = otraForma }
}

object auto{method nivel() = 15}
object robot{method nivel() = 30 }

object paqueteDeLadrillos{
    var cantidadLadrillos = 0
    method bulto() {
        if(cantidadLadrillos < 100) 
            return 1 
        else if(cantidadLadrillos > 100) 
            return 2
        else return 3
    } 
    method esCargado() {cantidadLadrillos += 12}
    method peso() = 2 * cantidadLadrillos
    method nivelDePeligrosidad() = 2
    method cambiarCantidad(cantidad) {cantidadLadrillos = cantidad}
}
object arena{
    method bulto() = 1
    var property peso = 10
    method nivelDePeligrosidad() = 1
    method esCargado() {peso = (peso - 10).max(0)}
}

object bateria{
    var estaConMisiles = false
    method bulto() = if(estaConMisiles) 2 else 1
    method peso() = if (estaConMisiles) 300 else 200
    method nivelDePeligrosidad() = if (estaConMisiles) 100 else 0
    method estadoActual() {estaConMisiles = !estaConMisiles}
    method esCargado() {estaConMisiles = true}
}
object contenedor{
    const cosasContenidas = []
    method bulto() = 1 + self.bultosDeCosasContenidas()
    method bultosDeCosasContenidas() = cosasContenidas.sum({c => c.bulto()})
    method peso() = 100 + self.pesoDeCosasContenidas()
    method meterElementos(listaElementos) = cosasContenidas.addAll(listaElementos)
    method pesoDeCosasContenidas() = cosasContenidas.sum({c => c.peso()})
    method cargarCosa(cosa) = cosasContenidas.add(cosa)
    method esCargado() {cosasContenidas.forEach({c => c.esCargado()})}
    method cosaMasPeligrosa() = cosasContenidas.max({c => c.nivelDePeligrosidad()})
    method nivelDePeligrosidad() = if (not cosasContenidas.isEmpty()) self.cosaMasPeligrosa().nivelDePeligrosidad() else 0
}   
object residuos{
    method bulto() = 1
    var property peso = 0
    method nivelDePeligrosidad() = 200
    method esCargado() {peso += 15}
}
object embalaje{
    var cosaEnvuelta = residuos
    method bulto() = 2
    method peso() = cosaEnvuelta.peso()
    method esCargado() {}
    method nivelDePeligrosidad() = cosaEnvuelta.nivelDePeligrosidad() / 2
    method cambiarCosaEnvuelta(nuevaCosa) {cosaEnvuelta = nuevaCosa}
}