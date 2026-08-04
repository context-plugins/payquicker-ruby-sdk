
# Balance Search Result

Polymorphic balance list result using oneOf with a discriminator on balanceType. Resolves to the appropriate typed list result based on the balanceType property value in the response body. A single response contains only one balance type — company or user — never a mix.

## Data Type

`CompanyBalanceListResult | UserBalanceListResult`

## Cases

| Type |
|  --- |
| [`CompanyBalanceListResult`](../../../doc/models/company-balance-list-result.md) |
| [`UserBalanceListResult`](../../../doc/models/user-balance-list-result.md) |

## CompanyBalanceListResult

### Initialization Code

#### Example

```ruby
value = CompanyBalanceListResult.new(
  payload: [
    CompanyBalanceObject.new(
      amount: '100000.00',
      currency: 'USD',
      formatted_amount: '$100,000.00 USD',
      token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      balance_type: BalanceType::COMPANY,
      program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
      capabilities: [
        'PAYMENT_SOURCE',
        'SPENDBACK_TARGET'
      ],
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/balances/search',
          method: 'GET',
          title: 'Self'
        ),
        'program' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/programs/prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
          method: 'GET',
          title: 'Program'
        )
      },
      related_cards: []
    )
  ],
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
  ),
  balance_type: envrr
)
```

## UserBalanceListResult

### Initialization Code

#### Example

```ruby
value = UserBalanceListResult.new(
  payload: [
    UserBalanceObject.new(
      amount: '2492.00',
      currency: 'USD',
      formatted_amount: '$2,492.00 USD',
      token: 'dest-925b8e69-7380-4827-b127-fda0801b090a',
      balance_type: BalanceType1::USER,
      program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
      capabilities: [
        'PREPAID_CARD',
        'USER_LOADABLE'
      ],
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/balances/search',
          method: 'GET',
          title: 'Self'
        ),
        'user' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/users/user-9051a6a6-1c86-4666-8f93-79251ce7039d',
          method: 'GET',
          title: 'User'
        ),
        'prepaidCard' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/prepaid-cards/dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
          method: 'GET',
          title: 'Prepaid Card'
        )
      },
      user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      prepaid_card_token: 'dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
      related_cards: [
        'dest-709c4084-75ca-41a7-99a4-5316ae470dff',
        'dest-ef104634-6c19-4f34-a1b1-9c92722d0c62'
      ],
      funding_account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272'
    )
  ],
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
  ),
  balance_type: envrr
)
```

