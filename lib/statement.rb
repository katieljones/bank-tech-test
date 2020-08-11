class Statement

  def print(transaction)
    head
    transaction.reverse_each { |s| puts s.gsub(",","||") }
  end

  def head
    puts "Date    ||Credit||Debit||Balance"
  end



end
