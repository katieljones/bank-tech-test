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
      expect(subject.transaction).to eq(["#{BankAccount::TIME}, 1000, 1000"])
    end

  end

  describe "# withdraw" do

    it "adds money into the customer's account" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq(500)
    end

    it "is stored in transaction array with the time and balance" do
      subject.withdraw(500)
      expect(subject.transaction).to eq(["#{BankAccount::TIME}, 500, -500"])
    end

  end




end
