require 'addressable/uri'
require 'net/http'
require 'cgi'
require 'oj'

module TappedOut
  module API
    # Base module for sending request to the tappedout api
    module Base
      FailedRequestException = Class.new(StandardError)
      MissingSessionTokenException = Class.new(StandardError)

      BASE_URL = 'http://tappedout.net/'
      PATH_PREFIX = 'api'

      module_function

      def execute_request(path_postfix, authorized = false)
        http, request = build_base_request(path_postfix)
        authorize_request!(request) if authorized

        response = http.request(request)
        return Oj.load(response.body) if response.is_a?(Net::HTTPSuccess)

        fail(
          FailedRequestException.new,
          "Request did not succeed: #{response.class}"
        )
      end

      def execute_authorized_request(path_postfix)
        execute_request(path_postfix, true)
      end

      def build_pathname(parts)
        File.join(parts)
      end

      def build_base_request(path_postfix)
        path = build_pathname([PATH_PREFIX, path_postfix])
        uri = Addressable::URI.join(BASE_URL, path)
        http = Net::HTTP.new(uri.host, 80)
        request = Net::HTTP::Get.new(uri.request_uri)

        [http, request]
      end

      def authorize_request!(request)
        fail MissingSessionTokenException if Environment.session_token.nil?
        cookie1 = CGI::Cookie.new('tapped', Environment.session_token)
        request['Cookie'] = cookie1.to_s
      end
    end
  end
end
