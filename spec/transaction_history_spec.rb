require 'transaction_history'

describe TransactionHistory do
  let(:transaction){ double :transaction, balance: 10 }
  let(:transaction_2){ double :transaction, balance: 15 }

  describe '.add' do
  it 'adds transaction to memory' do
    subject.add(transaction)
    expect(subject.memory).to include(transaction)
  end
  end

  describe '.is_a_deposit' do
    it 'returns true if the transaction adds to balance' do
      subject.add(transaction)
      subject.add(transaction_2)
      allow(transaction).to receive(:get_balance).and_return(10)
      allow(transaction_2).to receive(:get_balance).and_return(15)
      expect(subject.is_a_deposit(transaction_2)).to be true
    end
  end

  describe ".format_cell" do
    it 'left aligns data within 10 spaces' do
      expect(subject.format_cell("100")).to eq "100       "
    end
  end


end