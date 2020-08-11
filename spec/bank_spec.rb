require 'bank'

describe BankAccount do
  subject(:bank_account) { BankAccount.new(statement, transaction) }
  let(:statement) { double('statement') }
  let(:transaction) { double('transaction') }



  describe "# printing of a statement" do

    before do
      allow(statement).to receive(:print)
      allow(transaction).to receive(:transactions)
    end

    it 'calls the print method on statements' do
      bank_account.print_statement
      expect(statement).to have_received(:print)
    end


  end




end
