// Multipepita.wlk

import Alimentos.*
import Entrenador.*

object pepita {

	var energia = 100

	method estaCansada() {
		return energia < 50
	}

	method volar(kilometros) {
		energia = energia - 10 - kilometros
	}

	method come(comida) {
		energia = energia + comida.cantJoules()
	}

	method estaFeliz() {
		return energia.between(500, 1000)
	}

	method cuantoQuiereVolar() {
		if (energia.between(300, 400) && (energia.esMultiploDeVeinte())) {
			return (energia / 5) + 10 + 15
		} else {
			if (energia.between(300, 400)) {
				return (energia / 5) + 10
			} else {
				return (energia / 5) + 15
			}
		}
	}

	method esMultiploDeVeinte() {
		return energia % 20 == 0
	}

	method salirAComer() {
		self.volar(10)
		self.come(alpiste)
	}

	method haceLoQueQuieras() {
		if (self.estaCansada()) {
			self.come(alpiste)
		}
		if (self.estaFeliz()) {
			self.volar(8)
		}
	}

}


// Alimentos.wlk

object manzana {

	const joules = 50

	method cantJoules() {
		return joules
	}

}

object alpiste {

	var gramos = 10

	method cantJoules() {
		return gramos * 4
	}

}

object mijo {

	var joules = 0

	method mojarse() {
		joules = 15
	}

	method secarse() {
		joules = 20
	}

}

object canelones {

	var joules = 20
	var tieneSalsa = false
	var tieneQueso = false

	method cantJoules() {
		if (tieneSalsa == "true" && tieneQueso == "true") {
			return joules + 5 + 7
		} else {
			if (tieneSalsa == "true") {
				return 25
			} else {
				if (tieneQueso == "true") {
					return 27
				} else {
					return 20
				}
			}
		}
	}

	method poneleSalsa() {
		tieneSalsa = true
	}

	method sacaleSalsa() {
		tieneSalsa = false
	}

	method poneleQueso() {
		tieneQueso = true
	}

	method sacaleQueso() {
		tieneQueso = false
	}

}


// Entrenador.wlk

import Multipepita.*
import Alimentos.*

object roque {

	method entrenar() {
		pepita.volar(10)
		pepita.come(alpiste)
		pepita.volar(5)
		pepita.haceLoQueQuieras()
	}

}
