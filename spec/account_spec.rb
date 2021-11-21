require 'account'

describe Account do
let(:mock_hist) { double :mock_hist}
subject(:account) { described_class.new(mock_hist) }
  describe "initialisation" do
    it 'has a balance of 0' do
      expect(subject.balance).to eq 0
    end
    it 'creates a transaction history' do
      expect(subject.history).to eq mock_hist
    end
  end
end