//Vikingos
import Expediciones.*
class Vikingo{
	var casta
	method puedeIrA(unaExpedicion){
		return self.esProductivo() && casta.puedeSubirAExpedicion(self)
	}
	method esProductivo()
	method ascender(){
		casta = casta.subirClase()
	}
	method tieneArmas()
}

class Soldado inherits Vikingo {
	var cantArmas
	var vidasCobradas
	override method esProductivo(){
		return vidasCobradas>20&&self.tieneArmas()		
	}
	
	override method tieneArmas(){return cantArmas>0}

	
	override method ascender(){
		cantArmas += casta.aumentarArmas(cantArmas)
		super()
	}
}
class Granjero inherits Vikingo {
	var cantHijos
	var hectareasDesignadas
	override method esProductivo(){
		return 2*cantHijos<hectareasDesignadas
	}
	override method ascender(){
		cantHijos += casta.tenerHijos(cantHijos)
		hectareasDesignadas += casta.ganarHectareas(hectareasDesignadas)
		super()
	}
	override method tieneArmas(){return false}
	
}
 


class Casta{
	method puedeSubirAExpedicion(vik){return true}
	method aumentarArmas(cantArmas){return }
	method tenerHijos(cantHijos){return 0}
	method ganarHectareas(hectareasDesignadas){return 0}
	method ascender()
}

class Jarl inherits Casta{
	override method puedeSubirAExpedicion(vik){
		return !vik.tieneArmas()
	}
	
	override method ascender(){
		return new Karl()
	}
	override method aumentarArmas(cantArmas){
		return 10
	}
	override method tenerHijos(cantHijos){return 2}
	override method ganarHectareas(hectareasDesignadas){return 2}
}
class Karl inherits Casta{
	override method ascender(){
		return new Thrall()
	}
}
class Thrall inherits Casta{
	override method ascender(){return self}
}
