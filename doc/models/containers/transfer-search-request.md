
# Transfer Search Request

Polymorphic quote search request using oneOf. The transferType property determines which typed search criteria schema is applied. Cross-type searches are not supported — each request must target a single quote type.

## Data Type

`PaymentSearch | SpendbackSearch | PaymentRetractionSearch | TransferSearch | SpendbackRefundSearch`

## Cases

| Type |
|  --- |
| [`PaymentSearch`](../../../doc/models/payment-search.md) |
| [`SpendbackSearch`](../../../doc/models/spendback-search.md) |
| [`PaymentRetractionSearch`](../../../doc/models/payment-retraction-search.md) |
| [`TransferSearch`](../../../doc/models/transfer-search.md) |
| [`SpendbackRefundSearch`](../../../doc/models/spendback-refund-search.md) |

## PaymentSearch

### Initialization Code

#### Example

```ruby
value = PaymentSearch.new(
  transfer_type: TransferType::PAYMENT,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

## SpendbackSearch

### Initialization Code

#### Example

```ruby
value = SpendbackSearch.new(
  transfer_type: TransferType15::SPENDBACK,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

## PaymentRetractionSearch

### Initialization Code

#### Example

```ruby
value = PaymentRetractionSearch.new(
  transfer_type: TransferType16::RETRACTION,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

## TransferSearch

### Initialization Code

#### Example

```ruby
value = TransferSearch.new(
  transfer_type: TransferType17::TRANSFER,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

## SpendbackRefundSearch

### Initialization Code

#### Example

```ruby
value = SpendbackRefundSearch.new(
  transfer_type: TransferType18::REFUND,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)
```

