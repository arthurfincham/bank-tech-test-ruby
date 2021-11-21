require "account"
require "date"
describe Account do
  let(:mock_hist) { double :mock_hist, history: [] }
  subject(:account) { described_class.new(mock_hist) }

  before do
    allow(mock_hist).to receive(:add)
  end

  describe "initialisation" do
    it "has a balance of 0" do
      expect(subject.balance).to eq 0
    end
    it "creates a transaction history" do
      expect(subject.history).to eq mock_hist
    end
  end

  describe ".deposit" do
    before do
      subject.deposit(10, Date.new(2021, 10, 19))
    end

    it "updates the balance" do
      expect(subject.balance).to eq 10
    end

  end

  describe ".withdraw" do
    before do
      subject.deposit(10, Date.new(2021, 10, 20))
      subject.withdraw(5, Date.new(2021, 10, 19))
    end

    it "updates the balance" do
      expect(subject.balance).to eq 5
    end

    it "throws error if insufficient funds" do
      expect{ subject.withdraw(20, Date.new(2021, 10, 21)) }.to raise_error("Insufficient funds.")
    end
  
  end
end
