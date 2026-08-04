
# List Metadata

Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope.

*This model accepts additional fields of type Object.*

## Structure

`ListMetadata`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `page_no` | `Integer` | Required | **Default**: `1` |
| `page_size` | `Integer` | Required | **Default**: `10` |
| `page_count` | `Integer` | Required | **Default**: `1` |
| `record_count` | `Integer` | Required | - |
| `timezone` | `String` | Required | Timezone of the datetime objects in the response |
| `language` | `String` | Required | Language used for localized content in this response, determined by the Accept-Language request header. Falls back to en-US if the requested language is unavailable. |
| `request_ref` | `String` | Required | - |
| `version` | `String` | Required | API version of the response object, in YYYY.MM.DD format |
| `search_id` | `UUID \| String` | Optional | Unique identifier for the search session. Present only in search endpoint responses. Use this value with the corresponding `GET /search/{searchId}` endpoint to navigate pages. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
list_metadata = ListMetadata.new(
  page_no: 1,
  page_size: 10,
  page_count: 1,
  record_count: 2,
  timezone: 'UTC',
  language: 'en-US',
  request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
  version: '2026.02.01',
  search_id: '000017aa-0000-0000-0000-000000000000',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

