require 'spec_helper'

module TappedOut
  RSpec.describe API do
    describe '.latest_decks' do
      it_should_behave_like(
        'external request',
        API,
        'latest_decks',
        nil,
        'deck/latest/latest/'
      )
    end

    describe '.featured_decks' do
      it_should_behave_like(
        'external request',
        API,
        'featured_decks',
        nil,
        'deck/latest/featured/'
      )
    end

    describe '.deck_list' do
      before do
        allow(Environment).to(
          receive(:session_token)
            .and_return('my_session_token')
        )
      end

      it_should_behave_like(
        'external request',
        API,
        'deck_list',
        'my_deck',
        'collection/collection:deck/my_deck/'
      )
    end
  end
end
