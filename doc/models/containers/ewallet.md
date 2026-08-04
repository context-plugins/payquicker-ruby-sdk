
# Ewallet

Polymorphic electronic wallet request. The presence of userToken or accountToken determines whether this targets a user or account.

## Data Type

`UserEwallet | CompanyEwallet`

## Cases

| Type |
|  --- |
| [`UserEwallet`](../../../doc/models/user-ewallet.md) |
| [`CompanyEwallet`](../../../doc/models/company-ewallet.md) |

## UserEwallet

### Initialization Code

#### Example

```ruby
value = UserEwallet.new(
  instrument_type: InstrumentType1::EWALLET,
  user_token: 'user-b753b5c5-8c95-45ed-9348-68d646043301',
  type: 'ORANGE_MONEY',
  country: 'LR',
  currency: 'USD',
  fields: [
    EwalletField.new(
      key: 'GOVERNMENT_ID',
      value: '012345678'
    )
  ]
)
```

## CompanyEwallet

### Initialization Code

#### Example

```ruby
value = CompanyEwallet.new(
  instrument_type: InstrumentType1::EWALLET,
  account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  type: 'PAYPAL',
  country: 'US',
  currency: 'USD',
  fields: [
    EwalletField.new(
      key: 'ACCOUNT_ID',
      value: 'company@example.com'
    )
  ]
)
```

