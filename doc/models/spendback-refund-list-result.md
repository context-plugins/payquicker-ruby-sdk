
# Spendback Refund List Result

Paginated list of spendback refund objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`SpendbackRefundListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[SpendbackRefundObject]`](../../doc/models/spendback-refund-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `transfer_type` | [`TransferType23`](../../doc/models/transfer-type-23.md) | Required, Read-only | Discriminator value identifying this as a spendback refund quote list result. |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_refund_list_result = SpendbackRefundListResult.new(
  payload: [
    SpendbackRefundObject.new(
      token: 'rfnd-8975eb51-1baf-4549-a1d3-93f4f03d9c96',
      amount: '2.00',
      formatted_amount: '$2.00 USD',
      client_refund_ref: 'f2dfcbc1369d44268888b6590756a79a',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:05:48.0000000Z'),
      currency: 'USD',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      spendback_token: 'spnd-ae020490-edc1-4f96-b584-f989685a08bc',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
      quote_status: 'PENDING_ACCEPTANCE',
      transfer_type: TransferType10::REFUND,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/spend-back/spnd-ae020490-edc1-4f96-b584-f989685a08bc/refunds/rfnd-8975eb51-1baf-4549-a1d3-93f4f03d9c96',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ32B',
      acceptance_mode: 'MANUAL_ACCEPT',
      memo: 'Customer return — restocking',
      note: 'Funds returned to payee wallet',
      spendback_portal_id: 'FOCL1BEC8SCDNJ32A',
      client_spendback_ref: 'ac7d1dd70ac04100b59546f31863b139',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  transfer_type: TransferType23::REFUND,
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

