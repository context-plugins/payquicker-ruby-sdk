
# Transfer List Result

Paginated list of transfer objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`TransferListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[TransferObject]`](../../doc/models/transfer-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `transfer_type` | [`TransferType22`](../../doc/models/transfer-type-22.md) | Required | Discriminator value identifying this as a transfer quote list result. |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
transfer_list_result = TransferListResult.new(
  payload: [
    TransferObject.new(
      token: 'xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
      client_transfer_ref: 'c23a4e8c-7f0f-47ea-b833-fc985e01051d',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:34.0000000Z'),
      amount: '-0.01',
      formatted_amount: '($0.01) USD',
      currency: 'USD',
      destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      program_user_id: 'PQAPI-01866a624144f0e5f05e18de0c72d8a9',
      email: 'dyn1bec8scdnj2z4__neva_block@payquicker.testinator.com',
      quote_status: 'ACCEPTED',
      transfer_type: TransferType7::TRANSFER,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/transfers/xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ2ZM',
      delivery_details: DeliveryDetails.new(
        minimum_delivery_minutes: 4,
        maximum_delivery_minutes: 152,
        expected_delivery: 'SAME_DAY',
        expected_delivery_time: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      acceptance_mode: 'MANUAL_ACCEPT',
      fee: FeeConfiguration.new(
        category: 'COMPANY',
        distribution: [],
        source: 'TRANSACTION',
        total_amount: '0.00',
        transaction_amount: '0.00',
        type: 'BANK_TRANSFER',
        value_amount: '0.00',
        value_type: 'PERCENTAGE',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      fx_rate: FxRate.new(
        destination_amount: '-0.01',
        destination_currency: 'USD',
        destination_formatted_amount: '($0.01) USD',
        rate: '1.00',
        source_amount: '-0.01',
        source_currency: 'USD',
        source_formatted_amount: '($0.01) USD',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      memo: 'Q1 incentive transfer',
      note: 'Reissued after retraction',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-0838989a-7a5c-4e87-8466-ed1a7d31d9c0',
      lockside: 'SOURCE',
      method: 'ACCOUNT_TO_ACCOUNT_TRANSFER',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  transfer_type: TransferType22::TRANSFER,
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

