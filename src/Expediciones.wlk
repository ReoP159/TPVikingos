//Expediciones
import Vikingos.*

class VikingoInhabilitadoException inherits Exception{}
class Expedicion {
	var vikingosInvasores
	var localidades
	method valeLaPena(){
		return localidades.all({loc => loc.valeLocalidad(vikingosInvasores.size())})
	}
	
	method subirVikingo(vikingo){
		self.validarSubida(vikingo)
		vikingosInvasores.add(vikingo)
	}
	
	method validarSubida(vikingo){
		if(!vikingo.puedeIrA(self))
			throw new VikingoInhabilitadoException("vikingo inhabilitado")
	}
}

class Capital {
	var defensores
	var factorDeRiqueza
	method botin(vikingosInvasores){
		return 3*(defensores.min(vikingosInvasores))*factorDeRiqueza
	}	
	method valeLocalidad(vikingosInvasores){
		return self.botin(vikingosInvasores)>3*vikingosInvasores
	}
}

class Aldea {
	var crucifijos
	method botin(){
		return crucifijos
	}
	method valeLocalidad(vikingosInvasores){
		return self.botin()>=15
	}
}
class Amurallada inherits Aldea{
	var cantMinima
	override method valeLocalidad(vikingosInvasores){
			return super(vikingosInvasores)&&cantMinima<vikingosInvasores
	}
	
}
