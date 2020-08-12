require 'statement'
require 'bank'

describe Statement do
  subject(:statement) { Statement.new }

  subject(:transactions) do
    ["#{Time.now.strftime('%d/%m/%Y')},      , 1000.00, 1000.00"]
  end

  describe '# head' do
    it 'formats the output' do
      expect { statement.print(transactions) }.to output(print).to_stdout
    end

  end

  describe '# print' do
    it 'iterates through the array and outputs the complete transaction history' do
      expect(statement.print(transactions)).to eq(["#{Time.now.strftime('%d/%m/%Y')},      , 1000.00, 1000.00"])
    end
  end
end
