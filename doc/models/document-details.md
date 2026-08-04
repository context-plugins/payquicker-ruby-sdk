
# Document Details

One or more required fields, as discovered by `POST /documents/requirements/search` for the document type and country.

*This model accepts additional fields of type Object.*

## Structure

`DocumentDetails`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Required | Field names accepted by `POST /documents/search`'s `filters[].field` for searching uploaded [Documents](page:resources/documents) — `TYPE` (filter by document type), `STATUS` (filter by review status), and `EXPIRATION_DATE` (filter by expiry). See [Document Search Fields](page:additional-api-information/document-search-fields) for the full catalog and supported comparisons. |
| `value` | `String` | Required | Value for the document field |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_details = DocumentDetails.new(
  key: 'EXPIRATION_DATE',
  value: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

