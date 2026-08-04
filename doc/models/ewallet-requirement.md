
# Ewallet Requirement

Classifies the electronic-wallet information required for a given (country, currency, wallet-type) combination.

*This model accepts additional fields of type Object.*

## Structure

`EwalletRequirement`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `electronic_wallet_type` | `String` | Optional | Provider type of an electronic-wallet [Instrument](page:resources/instruments) — identifies which third-party wallet network the destination uses (e.g., `PAYPAL`, `VENMO`, `AIRTEL_MONEY`). Available providers depend on the payee's country and the program's configuration; discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the rails reference. |
| `country` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `fee` | [`FeeConfiguration`](../../doc/models/fee-configuration.md) | Optional | Fee configuration including category and distribution details. All monetary fields within this object (`totalAmount`, `transactionAmount`, `valueAmount`, and the `amount` on each distribution entry) are **always non-negative** on responses. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `source_country` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `source_currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `requirements` | [`Array[EwalletRequiredFields]`](../../doc/models/ewallet-required-fields.md) | Optional | Array of required fields for the electronic wallet |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_requirement = EwalletRequirement.new(
  electronic_wallet_type: 'PAYPAL',
  country: 'US',
  currency: 'USD',
  fee: nil,
  source_country: 'US',
  source_currency: 'USD',
  requirements: [
    EwalletRequiredFields.new(
      format: EwalletRequirementFormat.new(
        example: 'alberta.purdy@payquicker.testinator.com',
        legend: [
          EwalletRequirementFormatLegend.new(
            key: 'email',
            description: 'Email address registered with PayPal'
          )
        ]
      ),
      requirement: 'EWALLET_EMAIL',
      description: 'Email address registered with PayPal',
      validators: [
        EwalletRequirementValidator.new(
          expression: '^[^@\\s]+@[^@\\s]+$',
          validator_type: 'REGEX'
        )
      ]
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

