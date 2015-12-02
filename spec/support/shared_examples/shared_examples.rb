RSpec.shared_examples 'external request' do |klass, method, parameters, path|
  before do
    stub_request(:get, "http://tappedout.net/api/#{path}")
      .to_return(status: 200, body: '[{"hello": "World"}]')
  end

  context "when executing #{klass} #{method}" do
    before do
      @result = nil
      if parameters.nil?
        @result = klass.send(method)
      else
        @result = klass.send(method, parameters)
      end
    end

    it 'returns an array' do
      expect(@result).to be_an Array
    end

    it 'returns the correct object' do
      expect(@result).to eq [{ 'hello' => 'World' }]
    end
  end
end
