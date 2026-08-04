
# Bank Account Required Fields

Classifies the required [bank account fields](page:additional-api-information/bank-account-field-types).

*This model accepts additional fields of type Object.*

## Structure

`BankAccountRequiredFields`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `format` | [`BankAccountRequirementFormat`](../../doc/models/bank-account-requirement-format.md) | Optional | Classifies the format (e.g., regex pattern, max length) of a required bank-account field. |
| `requirement` | `String` | Optional | Classifies bank account [field types](page:additional-api-information/bank-account-field-types) |
| `description` | `String` | Optional | Localized requirement description for display purposes, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `validators` | [`Array[BankAccountRequirementValidator]`](../../doc/models/bank-account-requirement-validator.md) | Optional | Array of validation rules for this bank account field |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_required_fields = BankAccountRequiredFields.new(
  format: BankAccountRequirementFormat.new(
    example: 'string',
    legend: [
      BankAccountRequirementFormatLegend.new(
        key: 'string',
        description: 'string',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      )
    ],
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  requirement: 'BANK_ACH_ABA',
  description: 'string',
  validators: [
    BankAccountRequirementValidator.new(
      expression: 'string',
      validator_type: 'LENGTH',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

