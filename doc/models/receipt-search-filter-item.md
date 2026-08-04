
# Receipt Search Filter Item

A single filter row inside a `POST /receipts/search` request body's `filters` array. The `field` value comes from `ReceiptSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Receipt Search Fields`](page:additional-api-information/receipt-search-fields#filter-fields) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`ReceiptSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for receipt search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. Dates should be ISO 8601 format. Monetary amounts should be numeric strings (e.g., "100.00"). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_search_filter_item = ReceiptSearchFilterItem.new(
  field: 'CREATED_AT',
  comparison: 'GREATER_THAN',
  value: '2024-01-01T00:00:00Z',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

