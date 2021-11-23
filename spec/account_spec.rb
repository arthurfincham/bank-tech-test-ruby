require "account"
require "date"

describe Account do

  before(:all) do
    @mock_date = Date.new(2021,10,23)
  end

  describe ".deposit" do
    it "updates the balance" do
      expect{ subject.deposit(10, @mock_date) }.to change{subject.balance }.by (10)
    end

    it 'creates a new transcation' do
      expect(subject).to receive(:new_transaction).with(10, @mock_date)
      subject.deposit(10, @mock_date)
    end
  end

  describe ".withdraw" do
    before do
      subject.deposit(10, @mock_date)
    end

    it "throws error if insufficient funds" do
      expect { subject.withdraw(20, Date.new(2021, 10, 21)) }.to raise_error("Insufficient funds.")
    end

    it "updates the balance" do
      expect{ subject.withdraw(5, @mock_date) }.to change{subject.balance }.by (-5)
    end

    it 'creates a new transcation' do
      expect(subject).to receive(:new_transaction).with(5, @mock_date)
      subject.withdraw(5, @mock_date)
    end
  end
end
