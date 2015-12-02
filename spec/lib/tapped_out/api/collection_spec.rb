require 'spec_helper'

module TappedOut
  module API
    RSpec.describe Collection do
      describe '.deck' do
        before do
          allow(Environment).to(
            receive(:session_token)
              .and_return('my_session_token')
          )
        end

        it_should_behave_like(
          'external request',
          Collection,
          'deck',
          'my-deck',
          'collection/collection:deck/my-deck/'
        )
      end
    end
  end
end
