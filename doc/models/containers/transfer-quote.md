
# Transfer Quote

Transfer quote wrapper for gateway or portal transfer quotes

## Data Type

`GatewayTransferQuote | PortalTransferQuote`

## Cases

| Type |
|  --- |
| [`GatewayTransferQuote`](../../../doc/models/gateway-transfer-quote.md) |
| [`PortalTransferQuote`](../../../doc/models/portal-transfer-quote.md) |

## GatewayTransferQuote

### Initialization Code

#### Example

```ruby
value = GatewayTransferQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
  amount: '0.01',
  client_transfer_ref: '3ddfad8b-163d-41eb-acc7-e0fc052079f4',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType7::TRANSFER,
  currency: 'USD',
  memo: 'Wallet transfer',
  lockside: 'SOURCE'
)
```

## PortalTransferQuote

### Initialization Code

#### Example

```ruby
value = PortalTransferQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  program_user_id: 'PQAPI-01866a624144f0e5f05e18de0c72d8a9',
  email: 'neva_block@payquicker.testinator.com',
  amount: '0.01',
  client_transfer_ref: '3ddfad8b-163d-41eb-acc7-e0fc052079f4',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType7::TRANSFER,
  currency: 'USD',
  memo: 'Wallet transfer',
  lockside: 'SOURCE'
)
```

