require_relative 'statement'

class BankAccount

  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(amount)
    @balance += amount
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, , #{amount}, #{@balance}")
  end

  def withdraw(amount)
    fail "Insufficient funds available" if amount > @balance
    @balance -= amount
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, #{amount}, , #{@balance}")
  end

  def print_statement
    Statement.new.print
    @transaction.map { |s| puts s.gsub(",","||") }
  end


end
