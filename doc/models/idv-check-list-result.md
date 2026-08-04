
# Idv Check List Result

Paginated list of identity verification check objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`IdvCheckListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[IdvCheckObject]`](../../doc/models/idv-check-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
idv_check_list_result = IdvCheckListResult.new(
  payload: [
    IdvCheckObject.new(
      token: 'idvc-0a5152dc-b5ad-40b5-84ee-57b483136cb6',
      user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      idv_provider_reference: '142945612',
      idv_result: 'PASS',
      idv_provider: 'OFACANALYZER',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:59:03.0000000Z'),
      raw: '{"OfacId":"595132","SearchKey":"142945612","PossibleMatches":"0","SearchDate":"5/2/2026 3:59:02 PM"}',
      idv_check_type: 'SANCTIONS',
      idv_disposition: 'FINAL',
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/users/user-9051a6a6-1c86-4666-8f93-79251ce7039d/idv-checks/idvc-0a5152dc-b5ad-40b5-84ee-57b483136cb6',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      idv_sub_result: 'HARD',
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

