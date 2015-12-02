require 'spec_helper'

module TappedOut
  module API
    RSpec.describe Base do
      describe '.execute_request' do
        context 'when the request succeeds' do
          it 'returns the body of the response' do
            stub_request(:get, 'http://tappedout.net/api/test')
              .to_return(status: 200, body: '{"Hello": "World!"}')

            expect(Base.execute_request('test')).to eq('Hello' => 'World!')
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

      describe '.execute_authorized_request' do
        context 'when no session token has been set' do
          it 'raises an error' do
            expect { Base.execute_authorized_request('test') }
              .to raise_error(Base::MissingSessionTokenException)
          end
        end

        context 'when the session token has been set' do
          before do
            allow(Environment).to(
              receive(:session_token)
                .and_return('my_session_token')
            )
            headers = {
              'Accept' => '*/*',
              'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'Cookie' => 'tapped=my_session_token; path=',
              'User-Agent' => 'Ruby'
            }
            stub_request(:get, 'http://tappedout.net/api/test')
              .with(headers: headers)
              .to_return(status: 200, body: '{"Hello": "World!"}', headers: {})
          end

          it 'executes the request' do
            expect(Base.execute_authorized_request('test')).to(
              eq('Hello' => 'World!')
            )
          end
        end
      end

      describe '.build_pathname' do
        let(:result) { Base.build_pathname(['Hello', 'World!']) }
        it 'returns a string' do
          expect(result).to be_an String
        end

        it 'joins the strings in the array with an "/"' do
          expect(result).to eq 'Hello/World!'
        end
      end

      describe '.authorize_request!' do
        before do
          @request = {}
        end

        context 'when the session token is not set' do
          it 'raises an error' do
            expect { Base.authorize_request!(@request) }
              .to raise_error(Base::MissingSessionTokenException)
          end
        end

        context 'when the session token is set' do
          before do
            allow(Environment).to(
              receive(:session_token)
                .and_return('my_session_token')
            )
          end

          it 'adds the cookie string to the request object' do
            Base.authorize_request!(@request)
            expect(@request['Cookie']).to eq 'tapped=my_session_token; path='
          end
        end
      end
    end
  end
end
