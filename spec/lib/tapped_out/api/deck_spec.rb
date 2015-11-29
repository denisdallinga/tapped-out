require 'spec_helper'

module TappedOut
  module API
    RSpec.describe Deck do
      describe '.latest' do
        it_should_behave_like(
          'external request',
          Deck,
          'latest',
          'deck/latest/latest/'
        )
      end
    end
  end
end
