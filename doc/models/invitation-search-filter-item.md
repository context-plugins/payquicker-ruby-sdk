
# Invitation Search Filter Item

A single filter row inside a `POST /invitations/search` request body's `filters` array. The `field` value comes from `InvitationSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Invitation Search Fields`](page:additional-api-information/invitation-search-fields#filter-fields) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`InvitationSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for invitation search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. Dates should be ISO 8601 format. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_search_filter_item = InvitationSearchFilterItem.new(
  field: 'STATUS',
  comparison: 'EQUAL_TO',
  value: 'PENDING',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

