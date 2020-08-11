require_relative 'statement'

class BankAccount

  attr_reader :balance, :transaction, :statement

  def initialize(statement)
    @balance = 0
    @transaction = []
    @statement = statement
  end

  def deposit(debit)
    balance_incrase(debit)
    add_deposit_transaction(debit)
  end

  def withdraw(credit)
    guard(credit)
    balance_decrease(credit)
    add_withdraw_transaction(credit)
  end

  def print_statement
    statement.print(transaction)
  end

  private

  def balance_incrase(debit)
    @balance += debit
  end

  def balance_decrease(credit)
    @balance -= credit
  end

  def add_deposit_transaction(debit)
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, ---- , #{debit}.00, #{@balance}.00")
  end

  def add_withdraw_transaction(credit)
    @transaction.push("#{Time.now.strftime("%d/%m/%Y")}, #{credit}.00, ----- , #{@balance}.00")
  end

  def guard(credit)
    fail "Insufficient funds available" if credit > @balance
  end

end
