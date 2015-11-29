RSpec.shared_examples 'external request' do |klass, method, path|
  before do
    stub_request(:get, "http://tappedout.net/api/#{path}")
      .to_return(status: 200, body: '[{"hello": "World"}]')
  end

  context "when executing #{klass} #{method}" do
    it 'returns an array' do
      expect(klass.send(method)).to be_an Array
    end

    it 'returns the correct object' do
      expect(klass.send(method)).to eq [{ 'hello' => 'World' }]
    end
  end
end
