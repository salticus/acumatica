RSpec.describe Acumatica::Client do
  let(:client) do
    Acumatica::Client.configure do |config|
      config.url = ENV['ACUMATICA_URL']
      config.name = ENV['ACUMATICA_USER']
      config.password = password
    end
  end

  let(:password) { ENV['ACUMATICA_PASSWORD'] }

  describe '#login', :vcr do
    subject { client.login }

    context 'when login succeeds' do
      it { is_expected.to be(true) }
    end

    context 'when login fails' do
      let(:password) { nil }
      it { is_expected.to be(false) }
    end
  end

  describe '#logout', :vcr do
    subject { client.logout }

    it { is_expected.to be(true) }
  end
end