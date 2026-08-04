
# Payment Job Search Request

Request body for `POST /jobs/payments/search`. Composes `PaymentJobSearchFilterItem` entries under `filters` and `PaymentJobSearchSortItem` entries under `sort`, plus paging fields. See [Searching](page:concepts/searching) for the two-step search pattern and [Filtering & Sorting](page:concepts/filtering-sorting) for the comparison and direction semantics.

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobSearchRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `filters` | [`Array[PaymentJobSearchFilterItem]`](../../doc/models/payment-job-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `sort` | [`Array[PaymentJobSearchSortItem]`](../../doc/models/payment-job-search-sort-item.md) | Required | Sort criteria. Applied in order. If omitted, the endpoint's default sort is used. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_search_request = PaymentJobSearchRequest.new(
  filters: [],
  sort: [],
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

