require_relative 'statement'

class BankAccount

  attr_reader :balance, :transaction, :statement

  def initialize(statement)
    @balance = 0
    @transaction = []
    @statement = statement
  end

  def deposit(amount)
    balance_incrase(amount)
    add_deposit_transaction(amount)
  end

  def withdraw(amount)
    guard(amount)
    balance_decrease(amount)
    add_withdraw_transaction(amount)
  end

  def print_statement
    statement.print(transaction)
  end

  private

  def balance_incrase(amount)
    @balance += amount
  end

  def balance_decrease(amount)
    @balance -= amount
  end

  def add_deposit_transaction(amount)
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, ---- , #{amount}.00, #{@balance}.00")
  end

  def add_withdraw_transaction(amount)
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, #{amount}.00, ----- , #{@balance}.00")
  end

  def guard(amount)
    fail "Insufficient funds available" if amount > @balance
  end

end
