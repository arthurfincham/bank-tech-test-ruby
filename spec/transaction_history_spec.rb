Resolving dependencies...
require "transaction_history"

describe TransactionHistory do
  let(:transaction_1) { double :transaction, amount: 10, date: Date.new(2021, 10, 21), balance: 10 }
  let(:transaction_2) { double :transaction, amount: 20, date: Date.new(2021, 10, 22), balance: 30 }
  let(:transaction_3) { double :transaction, amount: 15, date: Date.new(2021, 10, 23), balance: 15 }

  describe ".add" do
    it "adds transaction to memory" do
      subject.add(transaction_1)
      expect(subject.memory).to include(transaction_1)
    end
  end

  describe ".is_a_deposit" do
    it "returns true if the transaction adds to balance" do
      subject.add(transaction_1)
      subject.add(transaction_2)
      allow(transaction_1).to receive(:get_balance).and_return(10)
      allow(transaction_2).to receive(:get_balance).and_return(20)
      expect(subject.is_a_deposit(transaction_2)).to be true
    end
  end

  describe ".format_cell" do
    it "left aligns data within 10 spaces" do
      expect(subject.format_cell("100")).to eq "100       "
    end
  end

  describe ".statement" do
    it "prints the format" do
      allow(transaction_1).to receive(:get_balance).and_return(10)
      allow(transaction_2).to receive(:get_balance).and_return(30)
      allow(transaction_3).to receive(:get_balance).and_return(15)
      subject.add(transaction_1)
      subject.add(transaction_2)
      subject.add(transaction_3)
      expectation = expect { subject.statement }
      expectation.to output("DATE      ||CREDIT    ||DEBIT     ||BALANCE    \n2021-10-21||10        ||          ||10        \n2021-10-22||20        ||          ||30        \n2021-10-23||          ||15        ||15        \n").to_stdout
    end
  end
end
