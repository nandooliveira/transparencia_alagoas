require "transparencia_alagoas/version"

require "models/patrimony"
require "models/bidding"
require "models/servant"

require "http_client"
require "json"
require "uri"

module TransparenciaAlagoas

	extend self

	def dispatch_get_request(url, options)
		options.each do |key, value|
    	url += "&#{key}=#{value}"
    end

		http_client = TransparenciaAlagoas::HttpClient.new
    response = http_client.doGet(URI.escape(url), nil)

    begin  
    	{status_code: response.code, status_message: response.message, data: JSON.parse(response.body)}
  	rescue  
    	{status_code: 500, status_message: "Wrong Request, please check the url #{url}", data: []}
  	end  
	end
end
