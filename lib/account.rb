require './lib/transaction'
require './lib/transaction_history'

class Account
  attr_reader :balance, :history
  def initialize(transaction_history = TransactionHistory)
    @balance = 0
    @history = transaction_history.new
  end

  def deposit(amount, date)
    @balance += amount
    new_transaction(amount, date)
  end

  def withdraw(amount, date)
    raise "Insufficient funds." if @balance < amount 
    @balance -= amount
    new_transaction(amount, date)
  end

  def new_transaction(amount, date, transaction = Transaction)
    tran = transaction.new(amount, date, @balance)
    @history.add(tran)
  end
end