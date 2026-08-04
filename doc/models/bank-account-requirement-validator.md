
# Bank Account Requirement Validator

Validator type that for the required bank account information.

*This model accepts additional fields of type Object.*

## Structure

`BankAccountRequirementValidator`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `validator_type` | `String` | Optional | Kind of validation rule attached to a required field on a bank-account or electronic-wallet [Instrument](page:resources/instruments) — `LENGTH` (field length constraints), `REGEX` (pattern match), `RANGE` (numeric range), `REQUIRED` (field must be present), or `UNDEFINED`. Returned by `POST /instruments/requirements/search` so client UIs can validate input before submission. See [Bank Account Field Types](page:additional-api-information/bank-account-field-types) for the field set these validators apply to. |
| `expression` | `String` | Required | Validation regular expression |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_requirement_validator = BankAccountRequirementValidator.new(
  expression: 'string',
  validator_type: 'LENGTH',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

