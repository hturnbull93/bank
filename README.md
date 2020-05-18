# Bank

This is a small project to practice maintaining code quality and process. [Source]

## Spec

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see:

```irb
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## Development Journal

### Domain Modelling

CRC modelling:

![CRC Model](images/Band-REPL-CRC.png)

### User Stories

- [x] 1

> As a Bank Manager,  
> So that we only take customers money,  
> I want accounts to start with balance 0

- [x] 2

> As a Customer,  
> So I can keep my money safe,  
> I want to be able to deposit into my account

- [x] 3

> As a Customer,  
> So I can spend my money,  
> I want to be able to withdraw from my account

- [x] 3.1

> As a Bank Manager,  
> So we don't go out of pocket,  
> I want withdrawals to only be allowed to occur if the customer has sufficient funds

- [ ] 4

> As a Customer,  
> So I can keep on top of my finances,  
> I want to be able to print my account statement

- [ ] 4.1

> As a Customer,  
> So I know when each transaction happened,  
> I want transactions on my statement to have the date

- [ ] 4.2

> As a Customer,  
> So I know how much each deposit was,  
> I want deposits on my statement to have the credit amount.

- [ ] 4.3

> As a Customer,  
> So I know how much each withdrawal was,  
> I want withdrawals on my statement to have the debit amount.

- [ ] 4.4

> As a Customer,  
> Because more recent transactions are more important to me,  
> I want the statement transactions to be ordered from newest to oldest.

### Set up

Initialised with Bundler, and added RSpec to the Gemfile in test/dev groups, then bundled to install.

Initialised RSpec.

### Accounts

- [x] 1

> As a Bank Manager,  
> So that we only take customers money,  
> I want accounts to start with balance 0

In `spec/account_spec.rb` wrote a test for an Account class that is initialised with a balance of 0. Red.

In `lib/account.rb`:

- Added class Account with initialize method setting balance attribute with 0, exposed as readable.

### Deposits

- [x] 2

> As a Customer,  
> So I can keep my money safe,  
> I want to be able to deposit into my account

Test for Account for a deposit method taking 100 results in a balance of 100. Red.

- Added deposit method with amount as param, sets balance to 100 hardcoded.

Green.

Test for Account for a deposit method taking 200 results in a balance of 200. Red.

- deposit method sets balance to the amount passed.

Green.

Test for Account for two deposits, one of 100 and another of 300, results in balance of 400.

- deposit method uses `+=` instead of just assigning balance with amount

### Withdrawals

- [x] 3

> As a Customer,  
> So I can spend my money,  
> I want to be able to withdraw from my account

Test for Account for a withdraw method. In the describe block added a before block to deposit 1000, so there is something to withdraw. 

Test for withdraw 100 results in a balance of 900. Red.

- Added withdraw method taking amount as param, sets balance to 900 hardcoded.

Test for withdraw 200 results in balance of 800. Red.

- withdraw now sets balance as balance less the withdrawn amount with the `-=` operator.

Green.

- [x] 3.1

> As a Bank Manager,  
> So we don't go out of pocket,  
> I want withdrawals to only be allowed to occur if the customer has sufficient funds

Test for withdraw 1500 results in error: Insufficient funds.

- within withdraw, if balance is less than amount raise 'Insufficient funds'

Green.

Refactored to guard clause from if block.

### Statement

- [ ] 4

> As a Customer,  
> So I can keep on top of my finances,  
> I want to be able to print my account statement

In `spec/account_feature_spec.rb` wrote a feature test based on the above acceptance criteria. Red.

- Added statement method to account.
- Hardcoded the response based on the expected statement.

Green.

Wrote another feature test with different figures. Red.

For this I think I should implement the Transaction class.

### Transactions

In `spec/transaction_spec.rb` added a test for Transaction class, it's display method returns a string in the format of a transaction row on a statement, with the time in the first column. Red.

In `lib/transaction.rb`:

- Transaction class initialised with time as Time.now.
- formatTime private helper method formats the time as the required "dd/mm/yyyy" string.
- display method returns the formatTime result into a string with columns as per the statement transaction row.

Green.

Test for display method to return a string in the format of a transaction row on a statement, with the time in the first column, and credit in second column when initialised with a credit keyword argument.

- Transaction initialise takes a keyword argument credit defaulting to nil, used to set credit instance variable.
- private helper method creditFormat checks if credit inst var is truthy then returns it as string with trailing space (easiest way I could find to get correct formatting).
- Display interpolates the creditFormat in the second column.

Green.

Test for display method to return a string in the format of a transaction row on a statement, with the time in the first column, and debit in third column when initialised with a debit keyword argument.

- Transaction initialise takes another keyword argument debit defaulting to nil, used to set debit instance variable.
- private helper method debitFormat checks if debit inst var is truthy then returns it as string with trailing space.
- Display interpolates the debitFormat in the third column.

Green.

Test for display method to return a string in the format of a transaction row on a statement, with the time in the first column, and balance in third column when initialised with a balance keyword argument.

- Transaction initialise takes another keyword argument balance defaulting to nil, used to set balance instance variable.
- display method interpolates balance in last column (no need for formatting helper here as it is the last column).

<!-- Links -->

[source]: https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md
