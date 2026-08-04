
# Bank Account Requirement Format

Classifies the format (e.g., regex pattern, max length) of a required bank-account field.

*This model accepts additional fields of type Object.*

## Structure

`BankAccountRequirementFormat`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `example` | `String` | Optional | Example of a requirement generated from the validator(s) |
| `legend` | [`Array[BankAccountRequirementFormatLegend]`](../../doc/models/bank-account-requirement-format-legend.md) | Optional | Array of legend items explaining field format placeholders |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_requirement_format = BankAccountRequirementFormat.new(
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
)
```

