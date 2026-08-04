
# Transfer Search

Wrapper used by `POST /transfers/search` to address the `transferType: TRANSFER` variant (Gateway only). See [Searching](page:concepts/searching) and [Transfers](page:resources/transfers).

*This model accepts additional fields of type Object.*

## Structure

`TransferSearch`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `transfer_type` | [`TransferType17`](../../doc/models/transfer-type-17.md) | Required | Discriminator value identifying this as a transfer. |
| `filters` | [`Array[TransferSearchFilterItem]`](../../doc/models/transfer-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `sort` | [`Array[TransferSearchSortItem]`](../../doc/models/transfer-search-sort-item.md) | Required | Sort criteria. Applied in order. If omitted, the endpoint's default sort is used. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
transfer_search = TransferSearch.new(
  transfer_type: TransferType17::TRANSFER,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

