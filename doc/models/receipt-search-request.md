
# Receipt Search Request

Request body for `POST /receipts/search`. Composes `ReceiptSearchFilterItem` entries under `filters` and `ReceiptSearchSortItem` entries under `sort`, plus paging fields. See [Searching](page:concepts/searching) for the two-step search pattern and [Filtering & Sorting](page:concepts/filtering-sorting) for the comparison and direction semantics.

*This model accepts additional fields of type Object.*

## Structure

`ReceiptSearchRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `scope` | `String` | Required | Scope token identifying the target. Must be a valid user token (`user-*`), account token (`acct-*`), or destination token (`dest-*`). |
| `scope_type` | `String` | Required | Indicates the type of value in the `scope` field. For this endpoint, only `TOKEN` is supported. |
| `filters` | [`Array[ReceiptSearchFilterItem]`](../../doc/models/receipt-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `sort` | [`Array[ReceiptSearchSortItem]`](../../doc/models/receipt-search-sort-item.md) | Required | Sort criteria. Applied in order. If omitted, the endpoint's default sort is used. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_search_request = ReceiptSearchRequest.new(
  scope: 'dest-925b8e69-7380-4827-b127-fda0801b090a',
  scope_type: 'TOKEN',
  filters: [],
  sort: [],
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

