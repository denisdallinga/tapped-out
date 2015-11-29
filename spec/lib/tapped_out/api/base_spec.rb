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

      describe '.build_pathname' do
        let(:result) { Base.build_pathname(['Hello', 'World!']) }
        it 'returns a string' do
          expect(result).to be_an String
        end

        it 'joins the strings in the array with an "/"' do
          expect(result).to eq 'Hello/World!'
        end
      end

      describe '.build_uri' do
        before do
          expect_uri(given: result)
        end

        context 'with empty path and empty parameters' do
          let(:result) { Base.build_uri(nil, nil) }

          it 'returns the correct string' do
            expect(result.to_s).to eq 'http://tappedout.net/'
          end
        end

        context 'with path and empty parameters' do
          let(:result) { Base.build_uri('hello/world', nil) }

          it 'returns the correct string' do
            expect(result.to_s).to eq 'http://tappedout.net/hello/world'
          end
        end

        context 'with empty path and parameters' do
          let(:result) { Base.build_uri(nil, hello: 'world') }

          it 'returns the correct string' do
            expect(result.to_s).to eq 'http://tappedout.net/?hello=world'
          end
        end

        context 'with path and parameters' do
          let(:result) { Base.build_uri('hello/world', hello: 'world') }

          it 'returns the correct string' do
            expect(result.to_s).to eq 'http://tappedout.net/hello/world?hello=world'
          end
        end

        def expect_uri(given:)
          expect(given).to be_an Addressable::URI
        end
      end
    end
  end
end
