module TappedOut
  module API
    # Module to handle requests to the deck endpoint
    module Deck
      PATH_PREFIX = 'deck/latest'

      module_function

      def latest
        execute_request('latest/')
      end

      def featured
        execute_request('featured/')
      end

      def execute_request(path_postfix)
        Base.execute_request(Base.build_pathname([PATH_PREFIX, path_postfix]))
      end
    end
  end
end
