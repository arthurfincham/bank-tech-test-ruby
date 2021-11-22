class TransactionHistory
  attr_reader :memory

  def initialize
    @memory = []
  end

  def add(tran)
    @memory << tran
  end

end