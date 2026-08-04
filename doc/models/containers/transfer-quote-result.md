
# Transfer Quote Result

Polymorphic quote result using oneOf with a discriminator on transferType. Resolves to the appropriate typed result object based on the transferType property value in the response body.

## Data Type

`PaymentResult | SpendbackResult | PaymentRetractionResult | TransferResult | SpendbackRefundResult`

## Cases

| Type |
|  --- |
| [`PaymentResult`](../../../doc/models/payment-result.md) |
| [`SpendbackResult`](../../../doc/models/spendback-result.md) |
| [`PaymentRetractionResult`](../../../doc/models/payment-retraction-result.md) |
| [`TransferResult`](../../../doc/models/transfer-result.md) |
| [`SpendbackRefundResult`](../../../doc/models/spendback-refund-result.md) |

## PaymentResult

### Initialization Code

#### Example

```ruby
value = PaymentResult.new(
  token: nil,
  amount: '11.02',
  formatted_amount: nil,
  client_payment_ref: 'd4b6f130-1d1c-4ce2-903a-0c1ad128f55e',
  created_at: DateTimeHelper.from_rfc3339(nil),
  currency: nil,
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  quote_status: nil,
  transfer_type: envrr,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  ),
  acceptance_mode: 'AUTO_ACCEPT',
  destination_token: 'dest-631b200f-665d-4dbe-bd01-3063c9dec97d',
  memo: 'string',
  note: 'string',
  purpose: 'BONUS',
  not_before: DateTimeHelper.from_rfc3339('2022-04-26T15:16:18Z'),
  not_after: DateTimeHelper.from_rfc3339('2019-08-24T14:15:22Z')
)
```

## SpendbackResult

### Initialization Code

#### Example

```ruby
value = SpendbackResult.new(
  token: nil,
  amount: '11.02',
  formatted_amount: nil,
  client_spendback_ref: 'string',
  created_at: DateTimeHelper.from_rfc3339(nil),
  currency: nil,
  destination_token: 'dest-631b200f-665d-4dbe-bd01-3063c9dec97d',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  quote_status: nil,
  transfer_type: envrr,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  ),
  acceptance_mode: 'AUTO_ACCEPT',
  memo: 'string',
  note: 'string'
)
```

## PaymentRetractionResult

### Initialization Code

#### Example

```ruby
value = PaymentRetractionResult.new(
  token: nil,
  amount: '1.23',
  formatted_amount: nil,
  client_retraction_ref: 'string',
  created_at: DateTimeHelper.from_rfc3339(nil),
  currency: nil,
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  destination_token: 'dest-631b200f-665d-4dbe-bd01-3063c9dec97d',
  payment_token: nil,
  client_payment_ref: nil,
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  quote_status: nil,
  transfer_type: envrr,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  ),
  acceptance_mode: 'AUTO_ACCEPT',
  allow_partial: false,
  memo: 'string',
  note: 'string'
)
```

## TransferResult

### Initialization Code

#### Example

```ruby
value = TransferResult.new(
  token: nil,
  client_transfer_ref: 'string',
  created_at: DateTimeHelper.from_rfc3339(nil),
  amount: '50.00',
  formatted_amount: nil,
  currency: nil,
  destination_token: 'dest-631b200f-665d-4dbe-bd01-3063c9dec97d',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  quote_status: nil,
  transfer_type: envrr,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  ),
  acceptance_mode: 'AUTO_ACCEPT',
  memo: 'string',
  note: 'string',
  lockside: 'SOURCE',
  method: 'IACH'
)
```

## SpendbackRefundResult

### Initialization Code

#### Example

```ruby
value = SpendbackRefundResult.new(
  token: nil,
  amount: '1.23',
  formatted_amount: nil,
  client_refund_ref: 'string',
  created_at: DateTimeHelper.from_rfc3339(nil),
  currency: nil,
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  destination_token: 'dest-631b200f-665d-4dbe-bd01-3063c9dec97d',
  spendback_token: nil,
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  quote_status: nil,
  transfer_type: envrr,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  ),
  acceptance_mode: 'AUTO_ACCEPT',
  memo: 'string',
  note: 'string'
)
```

