
# Spendback Quote

Spendback quote wrapper for gateway or portal spendback quotes

## Data Type

`GatewaySpendbackQuote | PortalSpendbackQuote`

## Cases

| Type |
|  --- |
| [`GatewaySpendbackQuote`](../../../doc/models/gateway-spendback-quote.md) |
| [`PortalSpendbackQuote`](../../../doc/models/portal-spendback-quote.md) |

## GatewaySpendbackQuote

### Initialization Code

#### Example

```ruby
value = GatewaySpendbackQuote.new(
  source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  amount: '0.50',
  client_spendback_ref: '6679a344d2c64b0db5a176ad84e88591',
  acceptance_mode: 'AUTO_ACCEPT',
  transfer_type: TransferType4::SPENDBACK,
  memo: 'Spendback purchase'
)
```

## PortalSpendbackQuote

### Initialization Code

#### Example

```ruby
value = PortalSpendbackQuote.new(
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'alberta.purdy@payquicker.testinator.com',
  amount: '0.50',
  client_spendback_ref: '6679a344d2c64b0db5a176ad84e88591',
  acceptance_mode: 'AUTO_ACCEPT',
  transfer_type: TransferType4::SPENDBACK,
  destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  memo: 'Spendback purchase'
)
```

