class Statement

  def print(transactions)
    head
    transactions.reverse_each { |transaction| puts transaction.gsub(",","||") }
  end

  def head
    return "  Date    ||Credit|| Debit ||Balance"
  end



end
