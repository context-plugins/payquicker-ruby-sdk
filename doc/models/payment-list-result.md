
# Payment List Result

Paginated list of payment objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`PaymentListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[PaymentObject]`](../../doc/models/payment-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `transfer_type` | [`TransferType19`](../../doc/models/transfer-type-19.md) | Required, Read-only | Discriminator value identifying this as a payment quote list result. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_list_result = PaymentListResult.new(
  payload: [
    PaymentObject.new(
      token: 'pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
      amount: '2.00',
      formatted_amount: '$2.00 USD',
      client_payment_ref: 'e53e963f051f4aa588a7515f13c82f3a',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:50.0000000Z'),
      currency: 'USD',
      program_user_id: 'PQAPI-a6f83b0f903fc540ee1cb41ed137983c',
      email: 'dyn1bec8scdnj2zk__alberta7@payquicker.testinator.com',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      quote_status: 'PENDING_ACCEPTANCE',
      transfer_type: TransferType::PAYMENT,
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
      acceptance_mode: 'MANUAL_ACCEPT',
      destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
      memo: 'Q2 performance bonus',
      note: 'Reissued after retracted payment',
      purpose: 'BONUS',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
      not_before: DateTimeHelper.from_rfc3339('2026-05-03T00:00:00.0000000Z'),
      not_after: DateTimeHelper.from_rfc3339('2026-06-03T00:00:00.0000000Z'),
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
  transfer_type: TransferType19::PAYMENT,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

