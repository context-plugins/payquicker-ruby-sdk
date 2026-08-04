
# Ewallet Field

One or more required fields, as discovered by `POST /instruments/requirements/search` for the (country, currency, electronic-wallet) combination.

*This model accepts additional fields of type Object.*

## Structure

`EwalletField`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `key` | `String` | Required | Classifies the field types submitted when creating or updating an electronic-wallet [Instrument](page:resources/instruments) — for example, the wallet's account ID, the registered phone number, or the recipient name. Required fields vary by provider, country, and currency; discover them via `POST /instruments/requirements/search`. |
| `value` | `String` | Required | Value for the electronic wallet field |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_field = EwalletField.new(
  key: 'UNDEFINED',
  value: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

