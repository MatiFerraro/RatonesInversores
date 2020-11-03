class Raton {
	
	var property dinero
	var inversionesRealizadas = []
	var inversionesPlaneadas = []
	
	method costoTotalInversionesRealizadas() {
		return inversionesRealizadas.sum({unaInversion => unaInversion.costo()})
	}
	
	method realizarInversion(unaInversion) {
		if(self.tieneDineroParaInversion(unaInversion)) {
			dinero -= unaInversion.costo()
			inversionesRealizadas.add(unaInversion)
		}
	}
	
	method tieneDineroParaInversion(unaInversion) {
		return dinero >= unaInversion.costo()
	}
	
	method realizarTodasLasInversionesPendientes() {
		inversionesPlaneadas.map({unaInversion => self.realizarInversion(unaInversion)})
	}
	
	method esAmbicioso() {
		return self.costoTotalInversionesPlaneadas() > dinero * 2
	}
	
	method costoTotalInversionesPlaneadas() {
		return inversionesPlaneadas.sum({unaInversion => unaInversion.costo()})
	}
	
}

object mickey inherits Raton {
	
}

object flautistaDeHamelin {
	
	var todosLosRatones = []
	
	method esMasRaton(unRaton, otroRaton) {
		return unRaton.costoTotalInversionesRealizadas() < otroRaton.costoTotalInversionesRealizadas()
	}
	
	method tocarLaFlauta() {
		var ratonesAmbiciosos = todosLosRatones.filter({unRaton => unRaton.esAmbicioso()})
		ratonesAmbiciosos.forEach({unRatonAmbicioso => unRatonAmbicioso.realizarTodasLasInversionesPendientes()})
	}
	
}
