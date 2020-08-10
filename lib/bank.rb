class BankAccount
  attr_reader :balance, :transaction

  TIME = Time.now.strftime("%d/%m/%Y")

  def initialize
    @balance = 0
    @transaction = []
  end

  def deposit(amount)
    @balance += amount
    @transaction.push("#{TIME}, #{amount}, #{@balance}")
  end

  def withdraw(amount)
    @balance -= amount
    @transaction.push("#{TIME}, #{amount}, #{@balance}")
  end


end
