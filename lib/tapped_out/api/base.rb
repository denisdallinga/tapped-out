require 'addressable/uri'
require 'net/http'

module TappedOut
  module API
    # Base module for sending request to the tappedout api
    module Base
      FailedRequestException = Class.new(StandardError)

      BASE_URL = 'http://tappedout.net/'
      PATH_PREFIX = 'api'

      module_function

      def execute_request(path_postfix, query_values = {})
        path = build_pathname([PATH_PREFIX, path_postfix])
        uri = build_uri(path, query_values)

        response = Net::HTTP.get_response(uri)

        return response.body if response.is_a?(Net::HTTPSuccess)

        fail(
          FailedRequestException.new,
          "Request did not succeed: #{response.class}"
        )
      end

      def build_pathname(parts)
        File.join(parts)
      end

      def build_uri(path, query_values)
        path = '' if path.nil?
        uri = Addressable::URI.join(BASE_URL, path)
        uri.query_values = query_values

        uri
      end
    end
  end
end
