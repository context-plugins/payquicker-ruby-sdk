
# Gateway Payment Job Quote

Quote returned by `POST /jobs/payments/quote` for a Gateway program — sums the individual payment quotes that will result if accepted, including total amount, fees, and per-row exceptions. Accept with `POST /jobs/payments/{token}/accept`. See [Payment Jobs](page:resources/payment-jobs).

*This model accepts additional fields of type Object.*

## Structure

`GatewayPaymentJobQuote`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `destination_token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `client_payment_ref` | `String` | Required | Unique value provided by the client for the payment, utilized for reference and deduplication. See [Transfers](page:resources/transfers) for the unified transfers endpoint that handles payments.<br><br>**Default**: `'d4b6f130-1d1c-4ce2-903a-0c1ad128f55e'`<br><br>**Constraints**: *Maximum Length*: `50` |
| `transfer_type` | [`TransferType`](../../doc/models/transfer-type.md) | Required | Discriminator value identifying this as a payment quote. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `purpose` | `String` | Optional | Purpose tag attached to a payment quote. Used by the platform for reporting categorization and, where the program enables it, by the tax-services calculation pipeline. The value is recorded on the resulting [receipt](page:resources/receipts) and surfaces on statements. See [Transfers](page:resources/transfers) for how purpose flows through the quote / accept lifecycle. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
gateway_payment_job_quote = GatewayPaymentJobQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
  amount: '150.00',
  client_payment_ref: 'ref-001',
  transfer_type: TransferType::PAYMENT,
  note: 'note0',
  memo: 'Q2 incentive bonus',
  purpose: 'BONUS',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

