require "transaction_history"

describe TransactionHistory do
  let(:transaction) { double :transaction, balance: 10 }

  describe ".add" do
    it "adds transaction to memory" do
      subject.add(transaction)
      expect(subject.memory).to include(transaction)
    end
  end
end
