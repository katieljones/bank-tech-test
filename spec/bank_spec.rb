require 'bank'

describe BankAccount do
  subject(:bank_account) { BankAccount.new(statement, transaction) }
  let(:statement) { double('statement') }
  let(:transaction) { double('transaction') }


  describe "# deposit" do
    it 'calls the deposit method on transaction class' do
      allow(transaction).to receive(:deposit)
      bank_account.deposit(10)
      expect(transaction).to have_received(:deposit)
    end
  end

  describe "# withdraw" do
    it 'calls the withdraw method on transaction class' do
      allow(transaction).to receive(:withdraw)
      bank_account.withdraw(10)
      expect(transaction).to have_received(:withdraw)
    end

  end

  describe "# printing of a statement" do
    before do
      allow(statement).to receive(:print)
      allow(transaction).to receive(:transactions)
    end

    it 'calls the print method on statements' do
      bank_account.print_statement
      expect(statement).to have_received(:print)
    end

    it 'gets the information stored in the transaction array' do
      bank_account.print_statement
      expect(transaction).to have_received(:transactions)
    end


  end




end
