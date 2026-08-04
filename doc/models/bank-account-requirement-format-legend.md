
# Bank Account Requirement Format Legend

Human-readable legend describing the format of a required bank-account field.

*This model accepts additional fields of type Object.*

## Structure

`BankAccountRequirementFormatLegend`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Optional | Placeholder key used in the format example |
| `description` | `String` | Optional | Localized requirement description for display purposes, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_requirement_format_legend = BankAccountRequirementFormatLegend.new(
  key: 'string',
  description: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

