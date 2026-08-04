
# User Balance List Result

Paginated list of user balance objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`UserBalanceListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[UserBalanceObject]`](../../doc/models/user-balance-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `balance_type` | [`BalanceType3`](../../doc/models/balance-type-3.md) | Required, Read-only | Discriminator value identifying this as a user balance list result. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_balance_list_result = UserBalanceListResult.new(
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
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        ),
        'user' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/users/user-9051a6a6-1c86-4666-8f93-79251ce7039d',
          method: 'GET',
          title: 'User',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        ),
        'prepaidCard' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/prepaid-cards/dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
          method: 'GET',
          title: 'Prepaid Card',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      prepaid_card_token: 'dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
      related_cards: [
        'dest-709c4084-75ca-41a7-99a4-5316ae470dff',
        'dest-ef104634-6c19-4f34-a1b1-9c92722d0c62'
      ],
      funding_account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
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
    version: '2026.02.01',
    search_id: '00002478-0000-0000-0000-000000000000',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    prev: nil,
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  balance_type: BalanceType3::USER,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

