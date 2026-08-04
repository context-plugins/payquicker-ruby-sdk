
# Receipt Search Sort Item

A single sort row inside a `POST /receipts/search` request body's `sort` array. The `field` value comes from `ReceiptSearchSortField`; `direction` is `ASC` or `DESC` (see [Filtering & Sorting](page:concepts/filtering-sorting)). Exactly one sort row is supported. See [`Receipt Search Fields`](page:additional-api-information/receipt-search-fields#sort-fields) for the catalog of sortable fields.

*This model accepts additional fields of type Object.*

## Structure

`ReceiptSearchSortItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Sortable fields for receipt search. |
| `direction` | `String` | Required | Sort direction. Defaults to descending.<br><br>**Default**: `'DESC'` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_search_sort_item = ReceiptSearchSortItem.new(
  field: 'CREATED_AT',
  direction: 'DESC',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

