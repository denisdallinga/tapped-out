module TappedOut
  # Module for setting and getting evironment specific variables
  module Environment
    @api_token = nil

    def api_token=(api_token)
      @api_token = api_token
    end
    module_function :api_token=

    def api_token
      @api_token
    end
    module_function :api_token
  end
end
