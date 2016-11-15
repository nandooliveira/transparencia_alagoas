module TransparenciaAlagoas
	class Patrimony
  	def self.property_list(qty: 10, offset: 0, options: {})
  		# return a list of government properties
      url = "/patrimonio/json-patrimonio-imobiliario/?limit=#{qty}&offset=#{offset}"
      TransparenciaAlagoas::dispatch_get_request(url, options)
  	end

  	def self.ug_list(qty: 10, offset: 0, options: {})
  		# Return the list of UGs (Unidades Gestoras)
  		url = "/patrimonio/json-patrimonio-mobiliario/?limit=#{qty}&offset=#{offset}"
     	TransparenciaAlagoas::dispatch_get_request(url, options)
  	end

  	def self.materials_list(qty: 10, offset: 0, ug_code: nil, options: {})
  		# Return the list of material owned by a given UG (Unidade Gestora)
  		url = "/patrimonio/json-patrimonio-mobiliario-materiais/#{ug_code}/?limit=#{qty}&offset=#{offset}"
     	TransparenciaAlagoas::dispatch_get_request(url, options)
  	end

  	def self.material_detail(qty: 10, offset: 0, ug_code: nil, material: nil, options: {})
  		# return the detailing of a given material in a given UG
  		url = "/patrimonio/json-patrimonio-mobiliario-detalhes/#{ug_code}/#{material}/?limit=#{qty}&offset=#{offset}"
     	TransparenciaAlagoas::dispatch_get_request(url, options)
  	end
  end
end