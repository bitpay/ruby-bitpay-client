RSpec.describe Bitpay::RubyClient do

  let(:bitpay_client) { Bitpay::RubyClient }

  let(:pem) { ENV['PEM'] }

  let(:bitpay_client_with_pem) {
    bitpay_client.new(
      api_uri: ENV['TEST_API_URI'], pem: ENV['PEM'], insecure: true
    )
  }

  describe '#initialize' do

    it 'should create a new client object' do

      expect(bitpay_client.new(api_uri: ENV['TEST_API_URI'], pem: pem)).to be_truthy

    end

    describe 'when the pem key is passed to initialize the client' do

      it 'should initialize the client object associated with the pem key' do

        expect(bitpay_client_with_pem.client_id).to eq(ENV['CLIENT_ID'])

      end

    end

    describe 'when the pem key is not passed to initialize client' do

      before { @client = bitpay_client.new(api_uri: ENV['TEST_API_URI']) }

      it 'should create a new client object' do

        expect(@client.client_id).to_not eq(ENV['CLIENT_ID'])

      end

      it 'should generate a new pem to create client object' do

        expect(@client.pem).to_not eq(ENV['PEM'])

      end

    end

  end

  describe '#pair_client' do

    before { @token_response = bitpay_client_with_pem.pair_client() }

    it 'should return the pairing code to initiate client side authentication' do
      expect(@token_response['data'][0].has_key?('pairingCode')).to be_truthy
    end

    it 'should contain the token for the client with pairing code' do
      expect(@token_response['data'][0].has_key?('token')).to be_truthy
    end

  end

end