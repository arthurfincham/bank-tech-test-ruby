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
    @memory[i].get_balance > @memory[i - 1].get_balance || i == 0 ? true : false
  end

  def format_cell(data)
    data.to_s.ljust(10, " ")
  end

  def statement
    puts "DATE      ||" + "CREDIT    ||" + "DEBIT     ||" + "BALANCE    "
    @memory.each do |item|
      is_a_deposit(item) ? print_credit(item) : print_debit(item)
    end
  end

  def print_credit(item)
    puts format_cell(item.date) + "||" +
           format_cell(item.amount) + "||" + format_cell(" ") + "||" +
           format_cell(item.balance)
  end

  def print_debit(item)
    puts format_cell(item.date) + "||" +
           format_cell(" ") + "||" + format_cell(item.amount) + "||" +
           format_cell(item.balance)
  end
end
