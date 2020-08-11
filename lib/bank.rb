class BankAccount
  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(amount)
    @balance += amount
    @transaction.push("date: #{Time.now.strftime("%d/%m/%Y")}, credit: 0, debit: #{amount}, balance: #{@balance}")
  end

  def withdraw(amount)
    fail "Insufficient funds available" if amount > @balance
    @balance -= amount
    @transaction.push("date: #{Time.now.strftime("%d/%m/%Y")}, credit: #{amount}, debit: 0, balance: #{@balance}")
  end

  def print_statement
    @transaction[0..-1]
  end




end
