require 'bank'

describe BankAccount do

  describe '#balance' do
    it 'should have a default balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

  describe "# deposit" do

    it "adds money into the customer's account" do
      subject.deposit(1000)
      expect(subject.balance).to eq(1000)
    end

    it "is stored in transaction array with the time and balance" do
      subject.deposit(1000)
      expect(subject.transaction).to eq(["date: #{Time.now.strftime("%d/%m/%Y")}, credit: 0, debit: 1000, balance: 1000"])
    end

  end

  describe "# withdraw" do

    it "adds money into the customer's account" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq(500)
    end

    it 'raises an error when credit is higher than debit' do
      expect{ subject.withdraw(500) }.to raise_error "Insufficient funds available"
    end

  end

  describe "# prints statement" do
    it 'returns a list of all transactions' do
      subject.deposit(10)
      subject.deposit(100)
      expect(subject.print_statement).to eq(["date: #{Time.now.strftime("%d/%m/%Y")}, credit: 0, debit: 10, balance: 10", "date: #{Time.now.strftime("%d/%m/%Y")}, credit: 0, debit: 100, balance: 110"])
    end

  end





end
