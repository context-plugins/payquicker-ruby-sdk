
# Spendback List Result

Paginated list of spendback objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`SpendbackListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[SpendbackObject]`](../../doc/models/spendback-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `transfer_type` | [`TransferType20`](../../doc/models/transfer-type-20.md) | Required, Read-only | Discriminator value identifying this as a spendback quote list result. |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_list_result = SpendbackListResult.new(
  payload: [
    SpendbackObject.new(
      token: 'spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
      amount: '0.50',
      formatted_amount: '$0.50 USD',
      client_spendback_ref: 'f48e4b082063492bb6e7d35408d98f83',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:01:40.0000000Z'),
      currency: 'USD',
      destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
      quote_status: 'ACCEPTED',
      transfer_type: TransferType4::SPENDBACK,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/spend-back/spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ2YW',
      acceptance_mode: 'AUTO_ACCEPT',
      fee: FeeConfiguration.new(
        category: 'COMPANY',
        distribution: [],
        source: 'TRANSACTION',
        total_amount: '0.50',
        transaction_amount: '0.50',
        type: 'SPENDBACK_PROCESSING_FEE',
        value_amount: '0.00',
        value_type: 'PERCENTAGE',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      memo: 'Order',
      note: 'Customer purchased company merchandise',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-401e7533-b973-4da6-baae-e336e540da2a',
      remaining_balance: '0.00',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  transfer_type: TransferType20::SPENDBACK,
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
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

