
# Gateway Transfer Quote

Quote returned by `POST /transfers` with `transferType: TRANSFER` for a Gateway program — bank transfers, account-to-account transfers, and prepaid card loads. Accept with `POST /transfers/{token}/accept`. See [Transfers](page:resources/transfers), [Transfer Types](page:additional-api-information/transfer-types), and [Transfer Method Types](page:additional-api-information/transfer-method-types).

*This model accepts additional fields of type Object.*

## Structure

`GatewayTransferQuote`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `destination_token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction — direction is conveyed by `transferType`, not by sign. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `client_transfer_ref` | `String` | Required | Unique value provided by the client for the transfer, utilized for reference and deduplication.<br><br>**Constraints**: *Maximum Length*: `50` |
| `currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `lockside` | `String` | Optional | Type of [lockside](page:additional-api-information/transfer-lockside-types) for transfers. |
| `method` | `String` | Optional | Underlying rail used to settle a `transferType: TRANSFER` to a bank-account or electronic-wallet [Instrument](page:resources/instruments). Examples: `IACH` (international ACH), `WIRE`, `LOCAL`. Available methods depend on the destination's country and currency — discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the full list. |
| `acceptance_mode` | `String` | Required | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `transfer_type` | [`TransferType7`](../../doc/models/transfer-type-7.md) | Required | Discriminator value identifying this as a transfer quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
gateway_transfer_quote = GatewayTransferQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
  amount: '0.01',
  client_transfer_ref: '3ddfad8b-163d-41eb-acc7-e0fc052079f4',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType7::TRANSFER,
  currency: 'USD',
  note: 'note4',
  memo: 'Wallet transfer',
  lockside: 'SOURCE',
  method: 'method2',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

