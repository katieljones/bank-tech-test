*Bank Tech test*
---
A practice test delivered at Makers Academy, focused on the production of best practice code, obeying the principles of OO Design and TDD.

**Requirements**
----
 - You should be able to interact with your code via a REPL like IRB.
-  Deposits, withdrawal.
-  Account statement (date, amount, balance) printing.
-  Data can be kept in memory (it doesn't need to be stored to a database or anything).

**Acceptance criteria**
----
Given a client makes a deposit of 1000 on 10-01-2012\
And a deposit of 2000 on 13-01-2012\
And a withdrawal of 500 on 14-01-2012\
When she prints her bank statement\
Then she would see\
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

**User Stories**
----
```
As a user,
So that I can save my money,
I'd like to be able to deposit funds in my bank account.

As a user,
So that I can access my savings,
I'd like to be able to withdraw funds from my bank account.

As a user,
So that I can review the timing of my transactions,
I'd like to be able to view the date each transaction was made.

As a user,
So that I can check what savings I have available,
I'd like to be able to view my balance.

As a user,
So that I can stay on top of my finances,
I'd like to be able to view my bank statement.
```

TDD principles were followed from the outset using the Red, Green Refactor approach.

**Installation Instructions**
----
From the command line, clone this repository to your machine:

```
$ git clone https://github.com/katieljones/bank-tech-test.git
$ cd bank_test
$ bundle install
```

**Running Code in REPL**

```
$ irb
# Load the file
require './lib/bank.rb'

# Create a new bank account, and perform some transactions
account = BankAccount.new(Statement.new, Transaction.new)
account.deposit(100)
account.withdraw(10)

# Review your bank statement
account.print_statement

# =>
 Date     || Credit  ||  Debit   || Balance
 21/06/18 ||  10.00  ||          || 90
 21/06/18 ||         ||  100.00  || 100
 ```
 **My Approach**
 ----
 My approach closely followed TDD and feature testing in IRB as shown above. I started running into difficulty when extracting the statement class. This was because it relied on Transactions. From here, I decided to create doubles and implemented some unit tests to test whether the class could receive the methods.

 **Testing Quality**
 ----
 All tests were written using Rspec and have 100% test coverage
 To run the tests, run the command below from the root folder:
 ```
 $ rspec

 ```

 **Run Code Linter**
 ```
 $ rubocop
 ```
