
# Instrument Search Request

Polymorphic instrument search request using oneOf. The instrumentType property determines which typed search criteria schema is applied. Each request must target a single instrument type (BANK or EWALLET).

## Data Type

`BankAccountSearchRequest | EwalletSearchRequest`

## Cases

| Type |
|  --- |
| [`BankAccountSearchRequest`](../../../doc/models/bank-account-search-request.md) |
| [`EwalletSearchRequest`](../../../doc/models/ewallet-search-request.md) |

## BankAccountSearchRequest

### Initialization Code

#### Example

```ruby
value = BankAccountSearchRequest.new(
  instrument_type: InstrumentType10::BANK,
  scope: 'user-c7dfa7cf-ea90-40d7-80a0-5219d54eb9ce',
  scope_type: 'TOKEN',
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

## EwalletSearchRequest

### Initialization Code

#### Example

```ruby
value = EwalletSearchRequest.new(
  instrument_type: InstrumentType11::EWALLET,
  scope: 'user-c7dfa7cf-ea90-40d7-80a0-5219d54eb9ce',
  scope_type: 'TOKEN',
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

