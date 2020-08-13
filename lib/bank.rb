require_relative 'statement'
require_relative 'transaction'

class BankAccount
  attr_reader :transaction

  def initialize(statement)
    @transaction = transaction
  end

  def deposit(debit)
    transaction.deposit(debit)
  end

  def withdraw(credit)
    transaction.withdraw(credit)
  end

  def print_statement(statement = Statement.new, transaction)
    statement.print(transaction.transactions)
  end
end
