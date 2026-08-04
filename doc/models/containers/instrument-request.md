
# Instrument Request

Polymorphic instrument create/update request using oneOf. The instrumentType property determines which typed request schema is applied. Each request must target a single instrument type (BANK or EWALLET) and include exactly one of userToken or accountToken to identify the target user or account.

## Data Type

`UserBankAccount | CompanyBankAccount | UserEwallet | CompanyEwallet`

## Cases

| Type |
|  --- |
| [`Mixed`](../../../doc/models/containers/bank-account.md) |
| [`Mixed`](../../../doc/models/containers/ewallet.md) |

## Mixed

### Initialization Code

#### Example

```ruby
value = UserBankAccount.new(
  instrument_type: InstrumentType::BANK,
  user_token: 'userToken6',
  purpose: 'purpose2',
  country: 'country0',
  currency: 'currency6',
  description: 'description6',
  fields: [
    nil
  ],
  type: 'type4',
  method: 'method0'
)
```

## Mixed

### Initialization Code

#### Example

```ruby
value = UserEwallet.new(
  instrument_type: InstrumentType1::EWALLET,
  user_token: 'userToken2',
  type: 'type8',
  country: 'country6',
  currency: 'currency2',
  fields: [
    nil,
    EwalletField.new(
      key: nil,
      value: nil
    )
  ]
)
```

