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

  end

end
