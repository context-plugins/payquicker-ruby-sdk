
# Search Request Base

Common base for all `POST /<resource>/search` request bodies — carries `page`, `pageSize`, and shared scope-discrimination fields. Concrete search-request schemas extend this via `allOf`. See [Searching](page:concepts/searching), [Pagination](page:concepts/pagination), and [Scope Discriminator](page:concepts/scope-discriminator).

*This model accepts additional fields of type Object.*

## Structure

`SearchRequestBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
search_request_base = SearchRequestBase.new(
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

