
# Bank Account Field

One or more required fields, as discovered by `POST /instruments/requirements/search` for the (country, currency) combination of the bank account.

*This model accepts additional fields of type Object.*

## Structure

`BankAccountField`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Required | Classifies bank account [field types](page:additional-api-information/bank-account-field-types) |
| `value` | `String` | Required | Value for the bank account field |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_field = BankAccountField.new(
  key: 'BANK_ACH_ABA',
  value: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

