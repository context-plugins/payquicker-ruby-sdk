
# Bank Account Requirement Search Filter Item

A single filter row inside a `POST /instruments/requirements/search` request body's `filters` array. The `field` value comes from `BankAccountRequirementSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Bank Account Field Types`](page:additional-api-information/bank-account-field-types) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`BankAccountRequirementSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for bank account requirement search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_requirement_search_filter_item = BankAccountRequirementSearchFilterItem.new(
  field: 'CURRENCY',
  comparison: 'EQUAL_TO',
  value: 'USD',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

