
# Company Balance List Result

Paginated list of company balance objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`CompanyBalanceListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[CompanyBalanceObject]`](../../doc/models/company-balance-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `balance_type` | [`BalanceType2`](../../doc/models/balance-type-2.md) | Required, Read-only | Discriminator value identifying this as a company balance list result. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
company_balance_list_result = CompanyBalanceListResult.new(
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
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        ),
        'program' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/programs/prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
          method: 'GET',
          title: 'Program',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      program_user_id: 'programUserId8',
      prepaid_card_token: 'prepaidCardToken0',
      related_cards: [],
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
  balance_type: BalanceType2::COMPANY,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

