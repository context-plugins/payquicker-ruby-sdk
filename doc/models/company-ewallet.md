
# Company Ewallet

Create or update an electronic-wallet [Instrument](page:resources/instruments) on a program account (the `instrumentType` discriminator must be `EWALLET`). Required fields vary by provider and country — discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types).

*This model accepts additional fields of type Object.*

## Structure

`CompanyEwallet`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `instrument_type` | [`InstrumentType1`](../../doc/models/instrument-type-1.md) | Required | Discriminator value identifying this as an electronic wallet instrument. |
| `account_token` | `String` | Required | Account token identifying the target account. |
| `type` | `String` | Required | Provider type of an electronic-wallet [Instrument](page:resources/instruments) — identifies which third-party wallet network the destination uses (e.g., `PAYPAL`, `VENMO`, `AIRTEL_MONEY`). Available providers depend on the payee's country and the program's configuration; discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the rails reference. |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `fields` | [`Array[EwalletField]`](../../doc/models/ewallet-field.md) | Required | Required electronic wallet fields as determined by requirements |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
company_ewallet = CompanyEwallet.new(
  instrument_type: InstrumentType1::EWALLET,
  account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  type: 'PAYPAL',
  country: 'US',
  currency: 'USD',
  fields: [
    EwalletField.new(
      key: 'ACCOUNT_ID',
      value: 'company@example.com',
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

