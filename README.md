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
date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
```

## Development Journal

### Domain Modelling

CRC modelling:

![CRC Model](images/Band-REPL-CRC.png)

### User Stories

- [ ] 1

> As a Bank Manager,  
> So that we only take customers money,  
> I want accounts to start with balance 0

- [ ] 2

> As a Customer,  
> So I can keep my money safe,  
> I want to be able to deposit into my account

- [ ] 3

> As a Customer,  
> So I can spend my money,  
> I want to be able to withdraw from my account

- [ ] 3.1

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

- [ ] 1

> As a Bank Manager,  
> So that we only take customers money,  
> I want accounts to start with balance 0

In `spec/account_spec.rb` wrote a tests for an Account class that is initialised with a balance of 0. Red.

In `lib/account.rb`:

Added class Account with initialize method setting balance attribute with 0, exposed as readable.

<!-- Links -->

[source]: https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md
