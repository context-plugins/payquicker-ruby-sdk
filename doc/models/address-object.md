
# Address Object

A structured address with a type classifier.

*This model accepts additional fields of type Object.*

## Structure

`AddressObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `address_type` | `String` | Required | Classifies the address kind on a [User](page:resources/users) profile — `RESIDENTIAL` (where the payee lives, used for KYC), `MAILING` (where physical mail and plastic cards are sent), or `BUSINESS` (the registered address of a business-type user). Most user records carry a residential address and may add mailing or business addresses as needed. |
| `address_line_1` | `String` | Required | Address Line 1<br><br>**Constraints**: *Maximum Length*: `255` |
| `address_line_2` | `String` | Optional | Second line of the street address<br><br>**Constraints**: *Maximum Length*: `255` |
| `address_line_3` | `String` | Optional | Third line of the street address<br><br>**Constraints**: *Maximum Length*: `255` |
| `city` | `String` | Required | City name with a maximum length of 50 characters<br><br>**Constraints**: *Maximum Length*: `50` |
| `region` | `String` | Required | State, province, or region<br><br>**Constraints**: *Maximum Length*: `50` |
| `postal_code` | `String` | Required | Postal or ZIP code<br><br>**Constraints**: *Minimum Length*: `3`, *Maximum Length*: `50` |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
address_object = AddressObject.new(
  address_type: 'RESIDENTIAL',
  address_line1: '2083 Crona Walks',
  city: 'Deangelomouth',
  region: 'VA',
  postal_code: '51456',
  country: 'US',
  address_line2: 'Suite 443',
  address_line3: 'Deangelomouth VA  51456',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

