require "account"
require "date"
describe Account do

  before(:all) do
    @mock_date = Date.new(2021,10,23)
  end

  describe "initialisation" do
    it "has a balance of 0" do
      expect(subject.balance).to eq 0
    end
  end

  describe ".deposit" do
    before do
      subject.deposit(10, @mock_date)
    end

    it "updates the balance" do
      expect(subject.balance).to eq 10
    end
  end

  describe ".withdraw" do
    before do
      subject.deposit(10, @mock_date)
      subject.withdraw(5, @mock_date)
    end

    it "updates the balance" do
      expect(subject.balance).to eq 5
    end

    it "throws error if insufficient funds" do
      expect { subject.withdraw(20, Date.new(2021, 10, 21)) }.to raise_error("Insufficient funds.")
    end
  end
end
