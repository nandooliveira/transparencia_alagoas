module TransparenciaAlagoas
	class Bidding
  	def self.get(qty: 10, offset: 0, options: {})
  		# Return biddings
      url = "/licitacao/json-editais/?limit=#{qty}&offset=#{offset}"
      if options != nil
      	if options.key? :start_date
      		url += "&data_realizacao_dti_=#{options[:start_date]}"
      		options.delete(:start_date)
      	end

      	if options.key? :end_date
      		url += "&data_realizacao_dtf_=#{options[:end_date]}"
      		options.delete(:end_date)
      	end
      end 

      TransparenciaAlagoas::dispatch_get_request(url)	
  	end
  end
end