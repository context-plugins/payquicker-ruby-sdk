
# Payment Search Sort Item

A single sort row inside a `POST /transfers/search` request body's `sort` array. The `field` value comes from `PaymentSearchSortField`; `direction` is `ASC` or `DESC` (see [Filtering & Sorting](page:concepts/filtering-sorting)). Exactly one sort row is supported. See [`Transfer Search Fields`](page:additional-api-information/transfer-search-fields#sort-fields) for the catalog of sortable fields.

*This model accepts additional fields of type Object.*

## Structure

`PaymentSearchSortItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Sortable fields for payment search. |
| `direction` | `String` | Required | Sort direction. Defaults to descending.<br><br>**Default**: `'DESC'` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_search_sort_item = PaymentSearchSortItem.new(
  field: 'CREATED_AT',
  direction: 'DESC',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

