
# Spendback Search Filter Item

A single filter row inside a `POST /transfers/search` request body's `filters` array. The `field` value comes from `SpendbackSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Transfer Search Fields`](page:additional-api-information/transfer-search-fields#transfertype-spendback) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`SpendbackSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for spendback search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. Dates should be ISO 8601 format. Monetary amounts should be numeric strings (e.g., "100.00"). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_search_filter_item = SpendbackSearchFilterItem.new(
  field: 'AMOUNT',
  comparison: 'GREATER_THAN',
  value: '0.00',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

