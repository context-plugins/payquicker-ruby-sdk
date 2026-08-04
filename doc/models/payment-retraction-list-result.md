
# Payment Retraction List Result

Paginated list of payment retraction objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`PaymentRetractionListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[PaymentRetractionObject]`](../../doc/models/payment-retraction-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `transfer_type` | [`TransferType21`](../../doc/models/transfer-type-21.md) | Required, Read-only | Discriminator value identifying this as a payment retraction quote list result. |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_retraction_list_result = PaymentRetractionListResult.new(
  payload: [
    PaymentRetractionObject.new(
      token: 'retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50',
      amount: '2.00',
      formatted_amount: '$2.00 USD',
      client_retraction_ref: 'c0f8bdcaf7c647d0be2ecf9e1d646cc8',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:09.0000000Z'),
      currency: 'USD',
      source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      payment_token: 'pmnt-240b953b-6276-4a1b-b982-61122bde3638',
      client_payment_ref: 'c125739e6fbb471987b474fa3527dcb5',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
      quote_status: 'PENDING_ACCEPTANCE',
      transfer_type: TransferType5::RETRACTION,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-240b953b-6276-4a1b-b982-61122bde3638/retractions/retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ307',
      acceptance_mode: 'MANUAL_ACCEPT',
      allow_partial: false,
      memo: 'Customer charge dispute',
      note: 'Funds reversed to source account',
      payment_retraction_portal_id: 'FOCL1BEC8SCDNJ306',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  transfer_type: TransferType21::RETRACTION,
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

