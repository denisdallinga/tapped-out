require 'spec_helper'

module TappedOut
  module API
    RSpec.describe Base do
      describe '.execute_request' do
        context 'when the request succeeds' do
          it 'returns the body of the response' do
            stub_request(:get, 'http://tappedout.net/api/test')
              .to_return(status: 200, body: 'Hello World!')

            expect(Base.execute_request('test')).to eq 'Hello World!'
          end
        end

        context 'when the request fails' do
          it 'raises an exception' do
            stub_request(:get, 'http://tappedout.net/api/test')
              .to_return(status: 300, body: 'Hello World!')

            expect { Base.execute_request('test') }
              .to raise_error(Base::FailedRequestException)
          end
        end
      end
    end
  end
end
