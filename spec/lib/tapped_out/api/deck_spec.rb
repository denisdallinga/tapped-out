require 'spec_helper'

module TappedOut
  module API
    RSpec.describe Deck do
      describe '.latest' do
        it_should_behave_like(
          'external request',
          Deck,
          'latest',
          nil,
          'deck/latest/latest/'
        )
      end

      describe '.featured' do
        it_should_behave_like(
          'external request',
          Deck,
          'featured',
          nil,
          'deck/latest/featured/'
        )
      end
    end
  end
end
