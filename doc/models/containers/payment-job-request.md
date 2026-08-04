
# Payment Job Request

Payment job wrapper for batch payment operations

## Data Type

`GatewayPaymentJob | PortalPaymentJob`

## Cases

| Type |
|  --- |
| [`GatewayPaymentJob`](../../../doc/models/gateway-payment-job.md) |
| [`PortalPaymentJob`](../../../doc/models/portal-payment-job.md) |

## GatewayPaymentJob

### Initialization Code

#### Example

```ruby
value = GatewayPaymentJob.new(
  items: [
    GatewayPaymentJobQuote.new(
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
      amount: '150.00',
      client_payment_ref: 'ref-001',
      transfer_type: TransferType::PAYMENT,
      memo: 'Q2 incentive bonus',
      purpose: 'BONUS',
      additional_properties: {
        'acceptanceMode' => JSON.parse('"AUTO_ACCEPT"')
      }
    ),
    GatewayPaymentJobQuote.new(
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
      amount: '75.00',
      client_payment_ref: 'ref-002',
      transfer_type: TransferType::PAYMENT,
      memo: 'Q2 incentive bonus',
      purpose: 'BONUS',
      additional_properties: {
        'acceptanceMode' => JSON.parse('"AUTO_ACCEPT"')
      }
    )
  ],
  not_before: DateTimeHelper.from_rfc3339('2026-05-10T00:00:00Z')
)
```

## PortalPaymentJob

### Initialization Code

#### Example

```ruby
value = PortalPaymentJob.new(
  items: [
    PortalPaymentJobQuote.new(
      source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'john.doe@email.com',
      amount: '11.02',
      client_payment_ref: 'd4b6f130-1d1c-4ce2-903a-0c1ad128f55e',
      transfer_type: TransferType::PAYMENT,
      note: 'string',
      memo: 'string',
      purpose: 'BONUS'
    )
  ],
  not_before: DateTimeHelper.from_rfc3339('2022-04-26T15:16:18Z'),
  not_after: DateTimeHelper.from_rfc3339('2019-08-24T14:15:22Z')
)
```

