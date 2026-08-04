
# Ewallet Search Request

Request body for `POST /ewallets/search`. Composes `EwalletSearchFilterItem` entries under `filters` and `EwalletSearchSortItem` entries under `sort`, plus paging fields. See [Searching](page:concepts/searching) for the two-step search pattern and [Filtering & Sorting](page:concepts/filtering-sorting) for the comparison and direction semantics.

*This model accepts additional fields of type Object.*

## Structure

`EwalletSearchRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `instrument_type` | [`InstrumentType11`](../../doc/models/instrument-type-11.md) | Required | Discriminator value identifying this as an electronic wallet instrument search. |
| `scope` | `String` | Required | Scope token identifying the target. Must be a valid user token (`user-*`) or account token (`acct-*`). |
| `scope_type` | `String` | Required | Indicates the type of value in the `scope` field. For this endpoint, only `TOKEN` is supported. |
| `filters` | [`Array[EwalletSearchFilterItem]`](../../doc/models/ewallet-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `sort` | [`Array[EwalletSearchSortItem]`](../../doc/models/ewallet-search-sort-item.md) | Required | Sort criteria. Applied in order. If omitted, the endpoint's default sort is used. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_search_request = EwalletSearchRequest.new(
  instrument_type: InstrumentType11::EWALLET,
  scope: 'user-c7dfa7cf-ea90-40d7-80a0-5219d54eb9ce',
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

