module TappedOut
  module API
    # Module to handle requests to the collection endpoint
    module Collection
      module_function

      def deck(deck_name)
        path = Base.build_pathname([
          'collection',
          'collection:deck',
          deck_name,
          '/'
        ])
        Base.execute_authorized_request(path)
      end
    end
  end
end
