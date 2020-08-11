require 'transaction'

describe Transaction do

  describe '#initialize' do
    it 'should have a default balance of zero' do
      expect(subject.balance).to eq(0)
    end
    it 'has a transaction history equal to an empty array ' do
     expect(subject.transactions).to eq []
   end
  end

  describe "# deposit" do

    it "adds money into the customer's account" do
      subject.deposit(1000)
      expect(subject.balance).to eq(1000)
    end

    it "is stored in transaction array with the time and balance" do
      subject.deposit(1000)
      expect(subject.transactions).to eq(["#{Time.now.strftime("%d/%m/%Y")}, ---- , 1000.00, 1000.00"])
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


end
