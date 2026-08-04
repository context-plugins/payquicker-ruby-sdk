
# Ewallet Required Fields

Classifies the required electronic-wallet fields.

*This model accepts additional fields of type Object.*

## Structure

`EwalletRequiredFields`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `format` | [`EwalletRequirementFormat`](../../doc/models/ewallet-requirement-format.md) | Optional | - |
| `requirement` | `String` | Optional | Classifies the field types submitted when creating or updating an electronic-wallet [Instrument](page:resources/instruments) — for example, the wallet's account ID, the registered phone number, or the recipient name. Required fields vary by provider, country, and currency; discover them via `POST /instruments/requirements/search`. |
| `description` | `String` | Optional | Localized requirement description for display purposes, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `validators` | [`Array[EwalletRequirementValidator]`](../../doc/models/ewallet-requirement-validator.md) | Optional | Array of validation rules for this electronic wallet field |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_required_fields = EwalletRequiredFields.new(
  format: EwalletRequirementFormat.new(
    example: 'string',
    legend: [
      EwalletRequirementFormatLegend.new(
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
  requirement: 'UNDEFINED',
  description: 'string',
  validators: [
    EwalletRequirementValidator.new(
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

