require 'bank'

describe BankAccount do
  subject(:bank_account) { BankAccount.new(statement, transaction) }
  let(:statement) { double('statement') }
  let(:transaction) { double('transaction') }

  describe '#initialize' do
    it 'should have a default balance of zero' do
      expect(subject.balance).to eq(0)
    end
    it 'has a transaction history equal to an empty array ' do
      expect(subject.transactions).to eq []
    end
  end

  describe '# deposit' do
    it "adds money into the customer's account" do
      subject.deposit(1000)
      expect(subject.balance).to eq(1000)
    end

    it 'is stored in transaction array with the time and balance' do
      subject.deposit(1000)
      expect(subject.transactions).to eq(["#{Time.now.strftime('%d/%m/%Y')},      , 1000.00, 1000.00"])
    end
  end

  describe '# withdraw' do
    it "adds money into the customer's account" do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq(500)
    end

    it 'raises an error when credit is higher than debit' do
      expect { subject.withdraw(500) }.to raise_error 'Insufficient funds available'
    end
  end

  describe '# printing of a statement' do
    before do
      allow(statement).to receive(:print)
    end

    it 'calls the print method on statements' do
      bank_account.print_statement
      expect(statement).to have_received(:print)
    end


  end
end
