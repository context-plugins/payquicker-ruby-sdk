
# Balance Search Filter Item

A single filter row inside a `POST /balances/search` request body's `filters` array. The `field` value comes from `BalanceSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Balance Search Fields`](page:additional-api-information/balance-search-fields#filter-fields) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`BalanceSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for balance search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
balance_search_filter_item = BalanceSearchFilterItem.new(
  field: 'CURRENCY',
  comparison: 'EQUAL_TO',
  value: 'USD',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

