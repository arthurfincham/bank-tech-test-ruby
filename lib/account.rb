require 'transaction_history'

class Account
  attr_reader :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit(amount, date)
    @balance += amount
    @history.add(amount, date)
  end

  def withdraw(amount, date)
    raise "Insufficient funds." if @balance < amount 
    @balance -= amount
    @history.add(amount, date)
  end

  def new_transaction(amount, date)

  end
end