
# Invitation Job Search Result

Paginated list of invitation job objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobSearchResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[InvitationJobObject]`](../../doc/models/invitation-job-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_search_result = InvitationJobSearchResult.new(
  payload: [
    InvitationJobObject.new(
      token: 'jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c',
      portal_id: 'ARCL1B6I34CMVKLC0',
      filename: 'API_7fc1a31f-74fe-424d-845f-b60392dfc79c.txt',
      created_at: DateTimeHelper.from_rfc3339('2026-02-07T22:23:09Z'),
      total_count: 1,
      valid_count: 1,
      invalid_count: 0,
      type: 'INVITATIONS',
      status: 'COMPLETED',
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/jobs/invitations/jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        ),
        'items' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/jobs/invitations/jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c/items',
          method: 'GET',
          title: 'Job Items',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
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

