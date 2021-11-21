require 'transaction_history'

class Account
  attr_reader :balance, :history
  def initialize(history = TransactionHistory.new)
    @balance = 0
    @history = history
  end
end