
# Ewallet Requirement Search Request

Request body for `POST /instruments/requirements/search`. Composes `EwalletRequirementSearchFilterItem` entries under `filters`, plus paging fields. Electronic wallet requirement search is not sortable. See [Searching](page:concepts/searching) for the two-step search pattern and [Filtering & Sorting](page:concepts/filtering-sorting) for the comparison semantics.

*This model accepts additional fields of type Object.*

## Structure

`EwalletRequirementSearchRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `instrument_type` | [`InstrumentType13`](../../doc/models/instrument-type-13.md) | Required | Discriminator value identifying this as an electronic wallet requirement search. |
| `scope` | `String` | Required | Scope token identifying the target. Must be a valid user token (`user-*`), account token (`acct-*`), or destination token (`dest-*`). |
| `scope_type` | `String` | Required | Indicates the type of value in the `scope` field. For this endpoint, only `TOKEN` is supported. |
| `filters` | [`Array[EwalletRequirementSearchFilterItem]`](../../doc/models/ewallet-requirement-search-filter-item.md) | Required | Filter criteria. Multiple filters are ANDed together. |
| `page` | `Integer` | Required | Page number (1-based). Defaults to 1.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Required | Number of results per page. Defaults to the endpoint's limit.<br><br>**Constraints**: `>= 1`, `<= 100` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_requirement_search_request = EwalletRequirementSearchRequest.new(
  instrument_type: InstrumentType13::EWALLET,
  scope: 'acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
  scope_type: 'TOKEN',
  filters: [
    EwalletRequirementSearchFilterItem.new(
      field: 'CURRENCY',
      comparison: 'EQUAL_TO',
      value: 'USD',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    EwalletRequirementSearchFilterItem.new(
      field: 'COUNTRY',
      comparison: 'EQUAL_TO',
      value: 'US',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  page: 1,
  page_size: 50,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

