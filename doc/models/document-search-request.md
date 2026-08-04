
# Document Search Request

Request body for `POST /documents/search`. Composes `DocumentSearchFilterItem` entries under `filters`, plus paging fields. Document search is not sortable. See [Searching](page:concepts/searching) for the two-step search pattern and [Filtering & Sorting](page:concepts/filtering-sorting) for the comparison semantics.

*This model accepts additional fields of type Object.*

## Structure

`DocumentSearchRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `scope` | `String` | Required | Scope token identifying the target. Must be a valid user token (`user-*`). |
| `scope_type` | `String` | Required | Indicates the type of value in the `scope` field. For this endpoint, only `TOKEN` is supported. |
| `filters` | [`Array[DocumentSearchFilterItem]`](../../doc/models/document-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_search_request = DocumentSearchRequest.new(
  scope: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  scope_type: 'TOKEN',
  filters: [],
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

