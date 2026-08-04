
# Document Requirement Search Filter Item

A single filter row inside a `POST /documents/requirements/search` request body's `filters` array. The `field` value comes from `DocumentRequirementSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`KYC Enums`](page:additional-api-information/kyc-enums) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`DocumentRequirementSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for document requirement search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value (e.g., KYC, NAME_CHANGE). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_requirement_search_filter_item = DocumentRequirementSearchFilterItem.new(
  field: 'COUNTRY',
  comparison: 'EQUAL_TO',
  value: 'US',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

