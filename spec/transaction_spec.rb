require 'transaction'

describe Transaction do 
  subject { described_class.new(100, Date.new(2021,11,22), 200) }
  describe '.get_balance' do 
    it 'returns the account balance at time of transaction' do
      
      expect(subject.get_balance).to eq 200
    end
  end
end