
# Ewallet Base

Electronic-wallet [Instrument](page:resources/instruments) — a payout destination representing a payee's account on a third-party wallet provider (e.g., PayPal, Venmo, Airtel Money). Carries the provider type, country, currency, the provider-specific identifying fields (account ID, phone number, etc.), and a verification status. The unified Instruments resource discriminates electronic wallets vs bank accounts via `instrumentType: EWALLET`.

*This model accepts additional fields of type Object.*

## Structure

`EwalletBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `instrument_type` | [`InstrumentType1`](../../doc/models/instrument-type-1.md) | Required | Discriminator value identifying this as an electronic wallet instrument.<br><br>**Default**: `InstrumentType1::EWALLET` |
| `type` | `String` | Required | Provider type of an electronic-wallet [Instrument](page:resources/instruments) — identifies which third-party wallet network the destination uses (e.g., `PAYPAL`, `VENMO`, `AIRTEL_MONEY`). Available providers depend on the payee's country and the program's configuration; discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the rails reference. |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `fields` | [`Array[EwalletField]`](../../doc/models/ewallet-field.md) | Optional | Array of electronic wallet fields and values |
| `status` | `String` | Required | Current verification status of an electronic-wallet [Instrument](page:resources/instruments). The status progresses from creation through provider verification — values mirror the bank-account status set (e.g., the wallet is awaiting validation, has been approved, or is under compliance hold). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_base = EwalletBase.new(
  token: 'dest-9d5b926a-6d16-4371-9533-b9c87bb64258',
  instrument_type: InstrumentType1::EWALLET,
  type: 'ALIPAY',
  country: 'CN',
  currency: 'CNY',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:57:12.0000000Z'),
  status: 'VERIFIED',
  fields: [
    EwalletField.new(
      key: 'GOVERNMENT_ID',
      value: '****5678',
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

