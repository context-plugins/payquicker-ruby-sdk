
# Bank Account Address

Address information for the bank account

*This model accepts additional fields of type Object.*

## Structure

`BankAccountAddress`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `address_1` | `String` | Required | Address Line 1<br><br>**Constraints**: *Maximum Length*: `255` |
| `address_2` | `String` | Optional | Second line of the street address<br><br>**Constraints**: *Maximum Length*: `255` |
| `address_3` | `String` | Optional | Third line of the street address<br><br>**Constraints**: *Maximum Length*: `255` |
| `city` | `String` | Required | City name with a maximum length of 50 characters<br><br>**Constraints**: *Maximum Length*: `50` |
| `region` | `String` | Optional | State, province, or region<br><br>**Constraints**: *Maximum Length*: `50` |
| `postal_code` | `String` | Required | Postal or ZIP code<br><br>**Constraints**: *Minimum Length*: `3`, *Maximum Length*: `50` |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_address = BankAccountAddress.new(
  address1: 'string',
  city: 'string',
  postal_code: 'nzl',
  country: 'US',
  address2: 'string',
  address3: 'string',
  region: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

