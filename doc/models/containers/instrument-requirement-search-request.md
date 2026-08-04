
# Instrument Requirement Search Request

Polymorphic instrument requirement search request using oneOf. The instrumentType property determines which typed search criteria schema is applied. Each request must target a single instrument type.

## Data Type

`BankAccountRequirementSearchRequest | EwalletRequirementSearchRequest`

## Cases

| Type |
|  --- |
| [`BankAccountRequirementSearchRequest`](../../../doc/models/bank-account-requirement-search-request.md) |
| [`EwalletRequirementSearchRequest`](../../../doc/models/ewallet-requirement-search-request.md) |

## BankAccountRequirementSearchRequest

### Initialization Code

#### Example

```ruby
value = BankAccountRequirementSearchRequest.new(
  instrument_type: InstrumentType12::BANK,
  scope: 'acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
  scope_type: 'TOKEN',
  filters: [
    BankAccountRequirementSearchFilterItem.new(
      field: 'CURRENCY',
      comparison: 'EQUAL_TO',
      value: 'USD'
    ),
    BankAccountRequirementSearchFilterItem.new(
      field: 'COUNTRY',
      comparison: 'EQUAL_TO',
      value: 'US'
    )
  ],
  page: 1,
  page_size: 50
)
```

## EwalletRequirementSearchRequest

### Initialization Code

#### Example

```ruby
value = EwalletRequirementSearchRequest.new(
  instrument_type: InstrumentType13::EWALLET,
  scope: 'acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
  scope_type: 'TOKEN',
  filters: [
    EwalletRequirementSearchFilterItem.new(
      field: 'CURRENCY',
      comparison: 'EQUAL_TO',
      value: 'USD'
    ),
    EwalletRequirementSearchFilterItem.new(
      field: 'COUNTRY',
      comparison: 'EQUAL_TO',
      value: 'US'
    )
  ],
  page: 1,
  page_size: 50
)
```

