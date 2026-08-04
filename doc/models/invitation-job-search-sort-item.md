
# Invitation Job Search Sort Item

A single sort row inside a `POST /jobs/invitations/search` request body's `sort` array. The `field` value comes from `InvitationJobSearchSortField`; `direction` is `ASC` or `DESC` (see [Filtering & Sorting](page:concepts/filtering-sorting)). Exactly one sort row is supported. See [`Invitation Job Search Fields`](page:additional-api-information/invitation-job-search-fields#sort-fields) for the catalog of sortable fields.

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobSearchSortItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Sortable fields for invitation job search. |
| `direction` | `String` | Required | Sort direction. Defaults to descending.<br><br>**Default**: `'DESC'` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_search_sort_item = InvitationJobSearchSortItem.new(
  field: 'CREATED_AT',
  direction: 'DESC',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

