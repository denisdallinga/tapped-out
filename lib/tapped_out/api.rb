module TappedOut
  # Module which exposes the top level endpoints API
  module API
    autoload :Base, 'tapped_out/api/base.rb'
    autoload :Deck, 'tapped_out/api/deck.rb'
    autoload :Collection, 'tapped_out/api/collection.rb'

    module_function

    def featured_decks
      Deck.featured
    end

    def latest_decks
      Deck.latest
    end

    def deck_list(deck_name)
      Collection.deck(deck_name)
    end
  end
end
