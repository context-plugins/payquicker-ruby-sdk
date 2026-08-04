
# Gateway Spendback Quote

Quote returned by `POST /transfers` with `transferType: SPENDBACK` for a Gateway program — debits the payee for goods or services purchased from the payer (reducing chargebacks and merchant processing fees). Accept with `POST /transfers/{token}/accept`. See [Transfers](page:resources/transfers) and [Spend Options](page:concepts/spend-options).

*This model accepts additional fields of type Object.*

## Structure

`GatewaySpendbackQuote`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `destination_token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `client_spendback_ref` | `String` | Required | Unique value provided by the client for the spendback<br><br>**Constraints**: *Maximum Length*: `50` |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `acceptance_mode` | `String` | Required | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `transfer_type` | [`TransferType4`](../../doc/models/transfer-type-4.md) | Required | Discriminator value identifying this as a spendback quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
gateway_spendback_quote = GatewaySpendbackQuote.new(
  source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  amount: '0.50',
  client_spendback_ref: '6679a344d2c64b0db5a176ad84e88591',
  acceptance_mode: 'AUTO_ACCEPT',
  transfer_type: TransferType4::SPENDBACK,
  memo: 'Spendback purchase',
  note: 'note4',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

