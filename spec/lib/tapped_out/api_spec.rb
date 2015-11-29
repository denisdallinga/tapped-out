require 'spec_helper'

module TappedOut
  RSpec.describe API do
    describe '.latest_decks' do
      it_should_behave_like(
        'external request',
        API,
        'latest_decks',
        'deck/latest/latest/'
      )
    end
  end
end
