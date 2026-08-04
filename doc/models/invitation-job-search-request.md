
# Invitation Job Search Request

Request body for `POST /jobs/invitations/search`. Composes `InvitationJobSearchFilterItem` entries under `filters` and `InvitationJobSearchSortItem` entries under `sort`, plus paging fields. See [Searching](page:concepts/searching) for the two-step search pattern and [Filtering & Sorting](page:concepts/filtering-sorting) for the comparison and direction semantics.

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobSearchRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `filters` | [`Array[InvitationJobSearchFilterItem]`](../../doc/models/invitation-job-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `sort` | [`Array[InvitationJobSearchSortItem]`](../../doc/models/invitation-job-search-sort-item.md) | Required | Sort criteria. Applied in order. If omitted, the endpoint's default sort is used. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_search_request = InvitationJobSearchRequest.new(
  filters: [],
  sort: [],
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

