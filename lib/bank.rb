require_relative 'statement'
require_relative 'transaction'

class BankAccount
  attr_reader :transaction, :statement

  def initialize(statement, transaction)
    @transaction = transaction
    @statement = statement
  end

  def deposit(debit)
    transaction.deposit(debit)
  end

  def withdraw(credit)
    transaction.withdraw(credit)
  end

  def print_statement
    statement.print(transaction.transactions)
  end
end
