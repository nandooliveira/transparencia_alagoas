require 'date'

module TransparenciaAlagoas
	class Servant
		def self.active_servants(qty: 10, offset: 0, month: nil, year: nil, options: {})
  		# Return the list of active public servants of Alagoas Government
			month = month != nil ? month : Date.today.strftime("%m")
			year = year != nil ? year : Date.today.strftime("%Y")

  		url = "/pessoal/json-servidores/?limit=#{qty}&offset=#{offset}&mes=#{month}&ano=#{year}"    

	    TransparenciaAlagoas::dispatch_get_request(url, options)
  	end

  	def self.detail_active_servant(qty: 10, offset: 0, servant_id: nil, options: {})
  		# Return the details of active public servant
  		url = "/pessoal/json-perfil-servidor/#{servant_id}/?limit=#{qty}&offset=#{offset}"
  	  TransparenciaAlagoas::dispatch_get_request(url, options)
	 	end

	 	def self.inactive_servants(qty: 10, offset: 0, month: nil, year: nil, options: {})
  		# Return the list of active public servants of Alagoas Government
			month = month != nil ? month : Date.today.strftime("%m")
			year = year != nil ? year : Date.today.strftime("%Y")

  		url = "/pessoal/json-servidores-inativos/?limit=#{qty}&offset=#{offset}&mes=#{month}&ano=#{year}"    

	    TransparenciaAlagoas::dispatch_get_request(url, options)
  	end

		def self.detail_inactive_servant(qty: 10, offset: 0, servant_id: nil, options: {})
  		# Return the details of active public servant
  		url = "/pessoal/json-perfil-servidor-inativo/#{servant_id}/?limit=#{qty}&offset=#{offset}"
  	  TransparenciaAlagoas::dispatch_get_request(url, options)
	 	end  	
	end
end