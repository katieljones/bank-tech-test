class Transaction
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(debit)
    balance_increase(debit)
    add_deposit_transaction(debit)
  end

  def withdraw(credit)
    guard(credit)
    balance_decrease(credit)
    add_withdraw_transaction(credit)
  end

  private

  def balance_increase(debit)
    @balance += debit
  end

  def balance_decrease(credit)
    @balance -= credit
  end

  def add_deposit_transaction(debit)
    @transactions.push("#{Time.now.strftime('%d/%m/%Y')},      , #{debit}.00, #{@balance}.00")
  end

  def add_withdraw_transaction(credit)
    @transactions.push("#{Time.now.strftime('%d/%m/%Y')}, #{credit}.00,       , #{@balance}.00")
  end

  def guard(credit)
    raise 'Insufficient funds available' if credit > @balance
  end
end
