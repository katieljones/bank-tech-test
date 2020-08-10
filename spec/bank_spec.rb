require 'bank'

describe BankAccount do

  describe '#balance' do
    it 'should have a default balance of zero' do
      expect(subject.balance).to eq(0)
    end
  end

end
