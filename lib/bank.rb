require_relative 'statement'

class BankAccount

  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(amount)
    @balance += amount
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, , #{amount}.00, #{@balance}.00")
  end

  def withdraw(amount)
    fail "Insufficient funds available" if amount > @balance
    @balance -= amount
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, #{amount}.00, , #{@balance}.00")
  end

  def print_statement(statement = Statement.new)
    statement.print(transaction)
  end


end
