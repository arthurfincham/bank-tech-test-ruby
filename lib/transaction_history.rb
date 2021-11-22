class TransactionHistory
  attr_reader :memory

  def initialize
    @memory = []
  end

  def add(tran)
    @memory << tran
  end

  def is_a_deposit(item)
    i = @memory.find_index(item)
    @memory[i].get_balance > @memory[i-1].get_balance || i == 0 ? true : false
  end
end