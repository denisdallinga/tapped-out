module TappedOut
  # Module for setting and getting evironment specific variables
  module Environment
    class << self
      attr_accessor :api_token
      attr_accessor :session_token
    end
  end
end
