object camion{
    const cosasCargadas = []
    
    method cargarCosas(listaDeCosas) = listaDeCosas.forEach({c => self.cargarCosa(c)})
    method cargarCosa(cosa) { cosasCargadas.add(cosa)
                            cosa.esCargado()}  
    method descargarCosas(cosa) { cosasCargadas.remove(cosa)}
    method peso() = 1000 + cosasCargadas.sum({ c => c.peso()})
    method todosLosPesosSonPares() = cosasCargadas.all({c => c.peso().even()})
    method hayCargaQuePesa(peso) = cosasCargadas.any({c => c.peso() == peso})
    method primercaCargaTieneNivelPeligrosidad(peligrosidad) =  cosasCargadas.findOrDefault({c => c.nivelPeligrosidad() == peligrosidad},"No hay cosa {peligrosa}")
    method cosasNivelDePeligrosidad(peligrosidad) = cosasCargadas.filter({c => c.nivelPeligrosidad() > peligrosidad})
    method cosaQueSuperaNivelPeligrosidad(cosa) = self.cosasNivelDePeligrosidad(cosa.nivelDePeligrosidad())
    method estaExcedidoPeso() = self.peso() > 2500
    method cantidadTotalDeBultos() = cosasCargadas.sum({c => c.bulto()})
    method camionPuedeCicularEnRuta(nivel) = !self.estaExcedidoPeso() and cosasCargadas.cosasNivelDePeligrosidad(nivel).isEmpty()
    method algunaCargaPesaEntre(min,max) = cosasCargadas.any({c => c.peso().between(min,max)})
    method cargaMasPesada() = cosasCargadas.max({c => c.peso()})

}
