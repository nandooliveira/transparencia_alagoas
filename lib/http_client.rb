module TransparenciaAlagoas

  require 'net/http'
  require 'uri'
  require 'json'
  require 'openssl'

  class HttpClient

    BASE_URL = "http://transparencia.al.gov.br"
    HEADERS = {
      'Content-Type' => 'application/json',
      'X-Requested-With' => 'XMLHttpRequest'
    }

    def doPost(endpoint, data)
      uri, http = config_connection(endpoint)

      request = Net::HTTP::Post.new(uri.request_uri, HEADERS)
      request.body = data.to_json

      # Send the request
      response = http.request(request)

      return response
    end

    def doGet(endpoint, data)
      uri, http = config_connection(endpoint)

      request = Net::HTTP::Get.new(uri.request_uri, HEADERS)

      if data
        request.body = data.to_json
      end

      # Send the request
      response = http.request(request)

      return response
    end

    private
      def config_connection(endpoint)
        uri = URI.parse("#{BASE_URL}#{endpoint}")

        # Create the HTTP objects
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = false

        return uri, http
      end
  end
end
