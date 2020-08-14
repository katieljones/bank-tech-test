require_relative 'statement'
require_relative 'transaction'

class BankAccount
  attr_reader :transaction, :statement, :balance, :transactions

  def initialize(statement, transaction)
    @balance = 0
    @transactions = []
    @transaction = transaction
    @statement = statement
  end

  def deposit(debit)
    @balance += debit
    create_deposit_transaction(debit)
  end

  def withdraw(credit)
    insufficient_funds_guard(credit)
    @balance -= credit
    create_withdraw_transaction(credit)
  end

  def print_statement
    statement.print(transactions)
  end

  private

  def create_deposit_transaction(debit)
    @transactions.push("#{Time.now.strftime('%d/%m/%Y')},      , #{'%.2f'%debit}, #{'%.2f'%balance}")
  end

  def create_withdraw_transaction(credit)
    @transactions.push("#{Time.now.strftime('%d/%m/%Y')}, #{'%.2f'%credit},       , #{'%.2f'%balance}")
  end

  def insufficient_funds_guard(credit)
    raise 'Insufficient funds available' if credit > @balance
  end

end
