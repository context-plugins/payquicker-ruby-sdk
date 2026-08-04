
# Statement Search Filter Item

A single filter row inside a `POST /statements/search` request body's `filters` array. The `field` value comes from `StatementSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Statement Search Fields`](page:additional-api-information/statement-search-fields#filter-fields) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`StatementSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for statement search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. Dates should be ISO 8601 format. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
statement_search_filter_item = StatementSearchFilterItem.new(
  field: 'FROM',
  comparison: 'GREATER_THAN',
  value: '2024-01-01',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

