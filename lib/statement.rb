class Statement

  def print(transactions)
    head
    transactions.reverse_each { |s| puts s.gsub(",","||") }
  end

  def head
    return "  Date    ||Credit|| Debit ||Balance"
  end



end
