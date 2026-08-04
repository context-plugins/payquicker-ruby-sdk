
# Transfer Request

Polymorphic quote request using oneOf. The transferType property in the request body identifies the transfer type being created and determines which service layer method handles the request. The oneOf members each carry a transferType with a fixed single-value enum for SDK type inference. No discriminator is applied on the request — discriminated typing is only used on response objects.

## Data Type

`PortalPaymentQuote | GatewayPaymentQuote | GatewaySpendbackQuote | PortalSpendbackQuote | PaymentRetractionQuote | GatewayTransferQuote | PortalTransferQuote | SpendbackRefundQuote`

## Cases

| Type |
|  --- |
| [`Object`](../../../doc/models/containers/payment-quote.md) |
| [`Mixed`](../../../doc/models/containers/spendback-quote.md) |
| [`PaymentRetractionQuote`](../../../doc/models/payment-retraction-quote.md) |
| [`Mixed`](../../../doc/models/containers/transfer-quote.md) |
| [`SpendbackRefundQuote`](../../../doc/models/spendback-refund-quote.md) |

## Object

### Initialization Code

#### Example

```ruby
value = PortalPaymentQuote.new(
  source_token: 'sourceToken4',
  program_user_id: 'programUserId4',
  email: 'email6',
  amount: 'amount2',
  client_payment_ref: 'clientPaymentRef4',
  acceptance_mode: 'acceptanceMode6',
  transfer_type: TransferType::PAYMENT
)
```

## Mixed

### Initialization Code

#### Example

```ruby
value = GatewaySpendbackQuote.new(
  source_token: 'sourceToken8',
  destination_token: 'destinationToken4',
  amount: 'amount8',
  client_spendback_ref: 'clientSpendbackRef8',
  acceptance_mode: 'acceptanceMode2',
  transfer_type: TransferType4::SPENDBACK
)
```

## PaymentRetractionQuote

### Initialization Code

#### Example

```ruby
value = PaymentRetractionQuote.new(
  payment_id: 'pmnt-240b953b-6276-4a1b-b982-61122bde3638',
  client_retraction_ref: 'cec0bb44f7f14d8b9ebffaf8e7329b99',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType5::RETRACTION,
  memo: 'cancel retraction test'
)
```

## Mixed

### Initialization Code

#### Example

```ruby
value = GatewayTransferQuote.new(
  source_token: 'sourceToken0',
  destination_token: 'destinationToken2',
  amount: 'amount6',
  client_transfer_ref: 'clientTransferRef0',
  acceptance_mode: 'acceptanceMode0',
  transfer_type: TransferType7::TRANSFER
)
```

## SpendbackRefundQuote

### Initialization Code

#### Example

```ruby
value = SpendbackRefundQuote.new(
  spendback_id: 'string',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  amount: '1.23',
  client_refund_ref: 'string',
  acceptance_mode: 'AUTO_ACCEPT',
  transfer_type: TransferType10::REFUND,
  memo: 'string',
  note: 'string'
)
```

