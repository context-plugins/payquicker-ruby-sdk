
# Fee Distribution

Fee distribution details including amount, currency, and responsibility

*This model accepts additional fields of type Object.*

## Structure

`FeeDistribution`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `amount` | `String` | Optional | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `description` | `String` | Optional | Localized description of the fee, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `formatted_amount` | `String` | Optional | Combination of the amount and currency type. On transfer-quote responses this string is **always sign-free** (never contains `-`, `(`, or `)`) — it can be rendered directly without further sign-stripping. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative))<br><br>**Default**: `'$0.05 USD'` |
| `percentage` | `String` | Optional | Fee percentage that the responsible account pays, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision)) |
| `responsibility` | `String` | Optional | Identifies which party bears the cost of a fee on a [Receipt](page:resources/receipts) — `COMPANY` (the program's funding account is debited), `USER` (the payee's wallet or card is debited), `PAYQUICKER` (PayQuicker absorbs the fee), or `UNDEFINED`. Configured per fee on the program's fee schedule. |
| `responsibility_source` | `String` | Optional | How a fee's responsibility is determined — `SCHEDULE` (the standard case, derived from the program's configured fee schedule) or `CREDIT` (the fee is offset against a fee credit). Appears alongside the `feeResponsibility` party on a [Receipt](page:resources/receipts) line item. |
| `source_token` | `String` | Optional | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
fee_distribution = FeeDistribution.new(
  amount: '1.02',
  currency: 'USD',
  description: 'string',
  formatted_amount: '$0.05 USD',
  percentage: '50.00',
  responsibility: 'COMPANY',
  responsibility_source: 'CREDIT',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

