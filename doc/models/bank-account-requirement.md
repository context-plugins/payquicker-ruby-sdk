
# Bank Account Requirement

Classifies the bank-account information required for a given (country, currency) combination.

*This model accepts additional fields of type Object.*

## Structure

`BankAccountRequirement`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `country` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `fee` | [`FeeConfiguration`](../../doc/models/fee-configuration.md) | Optional | Fee configuration including category and distribution details. All monetary fields within this object (`totalAmount`, `transactionAmount`, `valueAmount`, and the `amount` on each distribution entry) are **always non-negative** on responses. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `source_country` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `source_currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `methods` | `Array[String]` | Optional | Supported transfer method types for this requirement |
| `requirements` | [`Array[BankAccountRequiredFields]`](../../doc/models/bank-account-required-fields.md) | Optional | Array of required fields for the bank account |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_requirement = BankAccountRequirement.new(
  country: 'US',
  currency: 'USD',
  fee: nil,
  source_country: 'US',
  source_currency: 'USD',
  methods: [
    'ACH_TRANSFER'
  ],
  requirements: [
    BankAccountRequiredFields.new(
      format: BankAccountRequirementFormat.new(
        example: '021000021',
        legend: [
          BankAccountRequirementFormatLegend.new(
            key: 'routing-number',
            description: '9-digit ABA routing number'
          )
        ]
      ),
      requirement: 'BANK_ACH_ABA',
      description: 'ABA routing number',
      validators: [
        BankAccountRequirementValidator.new(
          expression: '9',
          validator_type: 'LENGTH'
        )
      ]
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

