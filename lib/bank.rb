require_relative 'statement'
require_relative 'transaction'

class BankAccount
  attr_reader :balance, :transaction, :statement

  def initialize(statement, transaction)
    @statement = statement
    @transaction = transaction
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
