
# Phone Number Object

A phone number with type classifier.

*This model accepts additional fields of type Object.*

## Structure

`PhoneNumberObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `number` | `String` | Required | The phone number. |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `number_type` | `String` | Required | Classifies a phone number on a [User](page:resources/users) profile as `PRIMARY` (the user's primary contact number) or `MOBILE` (a number capable of receiving SMS for verification flows and webhook confirmations). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
phone_number_object = PhoneNumberObject.new(
  number: '+15852282715',
  country: 'US',
  number_type: 'MOBILE',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

