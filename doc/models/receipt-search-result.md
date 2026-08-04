
# Receipt Search Result

Paginated list of receipt objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`ReceiptSearchResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[ReceiptObject]`](../../doc/models/receipt-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_search_result = ReceiptSearchResult.new(
  payload: [
    ReceiptObject.new(
      token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
      type: 'PAYMENT_RETRACTION',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:37.0000000Z'),
      sign: 'DEBIT',
      source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      portal_id: 'FOCL1BEC8SCDNJ31J',
      amount: '-2.00',
      formatted_amount: '($2.00) USD',
      currency: 'USD',
      status: 'COMPLETE',
      description: 'Retraction for FOCL1BEC8SCDNJ31G',
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/receipts/rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'alberta.purdy@payquicker.testinator.com',
      delivery_details: DeliveryDetails.new(
        minimum_delivery_minutes: 4,
        maximum_delivery_minutes: 152,
        expected_delivery: 'SAME_DAY',
        expected_delivery_time: DateTimeHelper.from_rfc3339('0001-01-01T21:00:00Z'),
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      details: ReceiptDetails.new(
        bank_account_id: '021000021',
        bank_account_id_type: 'BANK_ACH_ABA',
        bank_name: 'JPMorgan Chase Bank',
        bank_id: '021000021',
        bank_id_type: 'BANK_ACH_ABA',
        beneficary_name: 'Alberta Purdy',
        memo: 'Retraction for original payment',
        note: 'Retraction Initiated By Company',
        correlation_token: 'pmnt-7d631de0-3467-4ece-b408-29dc748ed615',
        processor_reference: 'c3c600111b62426797e8596bd1dcaa5f',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      fx_rate: FxRate.new(
        destination_amount: '-2.00',
        destination_currency: 'USD',
        destination_formatted_amount: '($2.00) USD',
        rate: '1.00',
        source_amount: '-2.00',
        source_currency: 'USD',
        source_formatted_amount: '($2.00) USD'
      ),
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
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

