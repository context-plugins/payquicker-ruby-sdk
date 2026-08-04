
# Instrument Result

Polymorphic instrument result. Resolves to either a bank account or electronic wallet result based on instrumentType.

## Data Type

`BankAccountResult | EwalletResult`

## Cases

| Type |
|  --- |
| [`BankAccountResult`](../../../doc/models/bank-account-result.md) |
| [`EwalletResult`](../../../doc/models/ewallet-result.md) |

## BankAccountResult

### Initialization Code

#### Example

```ruby
value = BankAccountResult.new(
  token: 'token2',
  instrument_type: InstrumentType::BANK,
  purpose: 'BUSINESS',
  country: 'US',
  currency: 'currency4',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  fields: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: 'string'
    )
  ],
  status: 'status6',
  type: 'CHECKING',
  method: 'IACH',
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
  address: BankAccountAddress.new(
    address1: 'string',
    city: 'string',
    postal_code: 'nzl',
    country: 'US',
    address2: 'string',
    address3: 'string',
    region: 'string'
  ),
  description: 'string'
)
```

## EwalletResult

### Initialization Code

#### Example

```ruby
value = EwalletResult.new(
  token: nil,
  instrument_type: InstrumentType1::EWALLET,
  type: 'AIRTEL_MONEY',
  country: 'US',
  currency: 'currency8',
  created_at: DateTimeHelper.from_rfc3339(nil),
  status: 'status0',
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
  fields: [
    EwalletField.new(
      key: 'UNDEFINED',
      value: 'string'
    )
  ]
)
```

