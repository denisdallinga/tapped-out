require 'addressable/uri'
require 'pathname'
require 'net/http'

module TappedOut
  module API
    # Base module for sending request to the tappedout api
    module Base
      BASE_URL = 'http://tappedout.net/'
      PATH_PREFIX = 'api'

      FailedRequestException = Class.new(StandardError)

      def execute_request(path_postfix, query_values = {})
        path = Pathname.new(PATH_PREFIX) + Pathname.new(path_postfix)
        uri = Addressable::URI.join(BASE_URL, path.to_s)
        uri.query_values = query_values

        response = Net::HTTP.get_response(uri)

        return response.body if response.is_a?(Net::HTTPSuccess)

        fail(
          FailedRequestException.new,
          "Request did not succeed: #{response.class}"
        )
      end
      module_function :execute_request
    end
  end
end
