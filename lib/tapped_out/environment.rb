module TappedOut
  module Environment
    @api_token = nil

    def api_token=(auth_token)
      @api_token = auth_token
    end
    module_function :api_token=

    def api_token
      @api_token
    end
    module_function :api_token
  end
end
