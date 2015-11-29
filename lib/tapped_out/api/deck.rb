module TappedOut
  module API
    # Module to handle requests to the deck endpoint
    module Deck
      module_function

      def latest
        Base.execute_request('deck/latest/latest/')
      end
    end
  end
end
