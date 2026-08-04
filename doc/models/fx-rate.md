
# Fx Rate

Exchange rate. On transfer-quote responses the `sourceAmount` and `destinationAmount` fields are **always non-negative** (and their formatted counterparts are always sign-free); `rate` itself follows mathematical convention and is unsigned by construction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative))

*This model accepts additional fields of type Object.*

## Structure

`FxRate`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_amount` | `String` | Optional | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction — direction is conveyed by `transferType`, not by sign. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `destination_currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `destination_formatted_amount` | `String` | Optional | Combination of the amount and currency type. On transfer-quote responses this string is **always sign-free** (never contains `-`, `(`, or `)`) — it can be rendered directly without further sign-stripping. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative))<br><br>**Default**: `'$0.05 USD'` |
| `rate` | `String` | Optional | Exchange rate, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision)). |
| `source_amount` | `String` | Optional | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `source_currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `source_formatted_amount` | `String` | Optional | Combination of the amount and currency type. On transfer-quote responses this string is **always sign-free** (never contains `-`, `(`, or `)`) — it can be rendered directly without further sign-stripping. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative))<br><br>**Default**: `'$0.05 USD'` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
fx_rate = FxRate.new(
  destination_amount: '50.00',
  destination_currency: 'USD',
  destination_formatted_amount: '$0.05 USD',
  rate: '0.85',
  source_amount: '1.02',
  source_currency: 'USD',
  source_formatted_amount: '$0.05 USD',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

