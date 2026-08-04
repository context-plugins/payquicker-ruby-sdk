
# Bank Account

Polymorphic bank account request. The presence of userToken or accountToken determines whether this targets a user or account.

## Data Type

`UserBankAccount | CompanyBankAccount`

## Cases

| Type |
|  --- |
| [`UserBankAccount`](../../../doc/models/user-bank-account.md) |
| [`CompanyBankAccount`](../../../doc/models/company-bank-account.md) |

## UserBankAccount

### Initialization Code

#### Example

```ruby
value = UserBankAccount.new(
  instrument_type: InstrumentType::BANK,
  user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  purpose: 'PERSONAL',
  country: 'US',
  currency: 'USD',
  description: 'Primary personal checking account',
  fields: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '222371863'
    ),
    BankAccountField.new(
      key: 'BANK_BBAN',
      value: '1102224234'
    ),
    BankAccountField.new(
      key: 'BANK_NAME',
      value: 'Central City Bank'
    ),
    BankAccountField.new(
      key: 'BENEFICIARY_NAME',
      value: 'Maybelle Volkman'
    )
  ],
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH'
)
```

## CompanyBankAccount

### Initialization Code

#### Example

```ruby
value = CompanyBankAccount.new(
  instrument_type: InstrumentType::BANK,
  account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  purpose: 'BUSINESS',
  country: 'US',
  currency: 'USD',
  description: 'Gateway company bank account',
  fields: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '222371863'
    ),
    BankAccountField.new(
      key: 'BANK_BBAN',
      value: '11022233'
    ),
    BankAccountField.new(
      key: 'BANK_NAME',
      value: 'Central City Bank'
    ),
    BankAccountField.new(
      key: 'BENEFICIARY_NAME',
      value: 'Hopster Rideshare'
    )
  ],
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH',
  address: BankAccountAddress.new(
    address1: '200 Company Avenue',
    city: 'Rochester',
    postal_code: '14623',
    country: 'US',
    region: 'NY'
  )
)
```

