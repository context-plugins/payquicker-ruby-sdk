
# Payment Job Item List Result

Paginated list of payment job item objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobItemListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[PaymentJobItemObject]`](../../doc/models/payment-job-item-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_item_list_result = PaymentJobItemListResult.new(
  payload: [
    PaymentJobItemObject.new(
      token: 'pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
      amount: '150.00',
      formatted_amount: '$150.00 USD',
      client_payment_ref: 'ref-001',
      created_at: DateTimeHelper.from_rfc3339('2026-04-06T13:13:24.0000000Z'),
      currency: 'USD',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'alberta.purdy@payquicker.testinator.com',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      quote_status: 'ACCEPTED',
      transfer_type: TransferType::PAYMENT,
      job_token: 'jobs-1151378b-ec9f-44f0-8179-6d6e877430ac',
      job_portal_id: 'ARCL1BBG6RS1YK8W0',
      line_number: 1,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ2ZK',
      acceptance_mode: 'AUTO_ACCEPT',
      destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
      memo: 'Q2 incentive bonus',
      note: 'Job-distributed bonus',
      purpose: 'BONUS',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
      not_before: DateTimeHelper.from_rfc3339('2026-04-06T13:13:24.0000000Z'),
      not_after: DateTimeHelper.from_rfc3339('2026-05-06T13:13:24.0000000Z'),
      exceptions: nil,
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

