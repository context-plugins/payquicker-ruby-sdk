
# Intrument Search Result

Polymorphic instrument list result. Resolves to the appropriate typed list result based on the instrumentType of the originating search.

## Data Type

`BankAccountListResult | EwalletListResult`

## Cases

| Type |
|  --- |
| [`BankAccountListResult`](../../../doc/models/bank-account-list-result.md) |
| [`EwalletListResult`](../../../doc/models/ewallet-list-result.md) |

## BankAccountListResult

### Initialization Code

#### Example

```ruby
value = BankAccountListResult.new(
  payload: [
    BankAccountObject.new(
      token: 'dest-d1242f80-d94d-40ad-8cbb-568af10c45fb',
      instrument_type: InstrumentType::BANK,
      purpose: 'PERSONAL',
      country: 'US',
      currency: 'USD',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:56:03.0000000Z'),
      fields: [
        BankAccountField.new(
          key: 'BANK_BBAN',
          value: '****4234'
        ),
        BankAccountField.new(
          key: 'BANK_ACH_ABA',
          value: '****1863'
        ),
        BankAccountField.new(
          key: 'BENEFICIARY_NAME',
          value: 'Maybelle Volkman'
        ),
        BankAccountField.new(
          key: 'BANK_NAME',
          value: 'Central City Bank'
        )
      ],
      status: 'VERIFIED',
      type: 'CHECKING',
      method: 'US_SAMEDAY_IACH',
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/instruments/dest-d1242f80-d94d-40ad-8cbb-568af10c45fb',
          method: 'GET',
          title: 'Self'
        )
      },
      description: 'Primary personal checking account'
    )
  ],
  instrument_type: InstrumentType::BANK,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

## EwalletListResult

### Initialization Code

#### Example

```ruby
value = EwalletListResult.new(
  payload: [
    EwalletObject.new(
      token: 'dest-9d5b926a-6d16-4371-9533-b9c87bb64258',
      instrument_type: InstrumentType1::EWALLET,
      type: 'ALIPAY',
      country: 'CN',
      currency: 'CNY',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:57:12.0000000Z'),
      status: 'VERIFIED',
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/instruments/dest-9d5b926a-6d16-4371-9533-b9c87bb64258',
          method: 'GET',
          title: 'Self'
        )
      },
      fields: [
        EwalletField.new(
          key: 'GOVERNMENT_ID',
          value: '****5678'
        )
      ]
    )
  ],
  instrument_type: InstrumentType1::EWALLET,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

