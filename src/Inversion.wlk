class Inversion {
	
	var costo
	
	method costo()
	
	method personajesInvolucrados()
	
}

class Compania inherits Inversion {
	
	var peliculasRealizadas = []
	var porcentaje
	
	method recaudacionTotal() {
		return peliculasRealizadas.sum({unaPelicula => unaPelicula.recaudacion()})
	}
	
	override method costo() {
		costo = self.recaudacionTotal() * (porcentaje / 100)
		return costo
	}
	
	override method personajesInvolucrados() {
		var unosPersonajesInvolucrados = peliculasRealizadas.map({unaPelicula => unaPelicula.personajes()})
		return unosPersonajesInvolucrados.asSet()
	}
	
}

class ParqueDeDiversiones inherits Inversion {
	
	var atracciones
	var m2
	const costoM2
	
	override method costo() {
		return atracciones + m2 * costoM2
	}
	
	override method personajesInvolucrados() {
		return null
	}
	
}

class Pelicula inherits Inversion {
	
	var costoProduccion
	var property personajes = []
	
	override method costo() {
		return costoProduccion + self.sueldoDeTodosLosPersonajes()
	}
	
	method sueldoDeTodosLosPersonajes() {
		return personajes.sum({unPersonaje => unPersonaje.sueldo()})
	}
	
	override method personajesInvolucrados() {
		return personajes
	}
	
}

class PeliculaIndependiente inherits Pelicula {
	
	override method costo() {
		return costoProduccion + self.sueldoDeLosCuatroMasCaros()
	}
	
	method sueldoDeLosCuatroMasCaros() {
		return self.losCuatroMasCaros().sum({unPersonaje => unPersonaje.sueldo()})
	}
	
	method losCuatroMasCaros() {
		const personajesOrdenadosPorSueldo = personajes.sortBy({per1, per2 => per1.sueldo() > per2.sueldo()})
		return personajesOrdenadosPorSueldo.first(4)
	}
	
}