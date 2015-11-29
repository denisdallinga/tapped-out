module TappedOut
  # Module which exposes the top level endpoints API
  module API
    autoload :Base, 'tapped_out/api/base.rb'
    autoload :Deck, 'tapped_out/api/deck.rb'

    module_function

    def featured_decks
    end

    def latest_decks
      Deck.latest
    end

    def deck_list
    end
  end
end
