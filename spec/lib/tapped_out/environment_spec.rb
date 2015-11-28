require 'spec_helper'

module TappedOut
  RSpec.describe Environment do
    describe '.api_token=' do
      it 'can be set' do
        expect(Environment.api_token = 'asdf').to eq 'asdf'
      end
    end

    describe '.api_token' do
      it 'can be retrieved' do
        Environment.api_token = 'asdf'
        expect(Environment.api_token).to eq 'asdf'
      end
    end
  end
end
