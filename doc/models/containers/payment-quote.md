
# Payment Quote

Payment Quote

## Data Type

`PortalPaymentQuote | GatewayPaymentQuote`

## Cases

| Type |
|  --- |
| [`PortalPaymentQuote`](../../../doc/models/portal-payment-quote.md) |
| [`GatewayPaymentQuote`](../../../doc/models/gateway-payment-quote.md) |

## PortalPaymentQuote

### Initialization Code

#### Example

```ruby
value = PortalPaymentQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  program_user_id: 'PQAPI-a6f83b0f903fc540ee1cb41ed137983c',
  email: 'alberta7@payquicker.testinator.com',
  amount: '2.00',
  client_payment_ref: '2d8a3d44a9194d3ea87a2c99154e8523',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType::PAYMENT,
  memo: 'Q2 incentive',
  purpose: 'BONUS'
)
```

## GatewayPaymentQuote

### Initialization Code

#### Example

```ruby
value = GatewayPaymentQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
  amount: '2.00',
  client_payment_ref: '2d8a3d44a9194d3ea87a2c99154e8523',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType::PAYMENT,
  memo: 'Q2 incentive',
  purpose: 'BONUS'
)
```

