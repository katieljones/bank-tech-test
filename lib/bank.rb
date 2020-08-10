class BankAccount
  attr_reader :balance, :transaction

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(amount)
    @balance += amount
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, 0, #{amount}, #{@balance}")
  end

  def withdraw(amount)
    @balance -= amount
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, #{amount}, 0, #{@balance}")
  end

  def print_statement
    @transaction[0..-1]
  end




end
