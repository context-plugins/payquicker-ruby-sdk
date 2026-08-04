
# Prepaid Card Search Sort Item

A single sort row inside a `POST /prepaid-cards/search` request body's `sort` array. The `field` value comes from `PrepaidCardSearchSortField`; `direction` is `ASC` or `DESC` (see [Filtering & Sorting](page:concepts/filtering-sorting)). Exactly one sort row is supported. See [`Prepaid Card Search Fields`](page:additional-api-information/prepaid-card-search-fields#sort-fields) for the catalog of sortable fields.

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardSearchSortItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Sortable fields for prepaid card search. |
| `direction` | `String` | Required | Sort direction. Defaults to descending.<br><br>**Default**: `'DESC'` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_search_sort_item = PrepaidCardSearchSortItem.new(
  field: 'CREATED_AT',
  direction: 'DESC',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

