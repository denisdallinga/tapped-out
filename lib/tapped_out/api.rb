module TappedOut
  # Module which exposes the top level endpoints API
  module API
    autoload :Base, 'tapped_out/api/base.rb'

    def featured_decks
    end
    module_function :featured_decks

    def latest_decks
    end
    module_function :latest_decks

    def deck_list
    end
    module_function :deck_list
  end
end
