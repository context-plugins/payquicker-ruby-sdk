
# Portal Payment Job Quote

Quote returned by `POST /jobs/payments/quote` for a Hosted Portal program — sums the individual payment quotes that will result if accepted, including total amount, fees, and per-row exceptions. Accept with `POST /jobs/payments/{token}/accept`. See [Payment Jobs](page:resources/payment-jobs).

*This model accepts additional fields of type Object.*

## Structure

`PortalPaymentJobQuote`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `client_payment_ref` | `String` | Required | Unique value provided by the client for the payment, utilized for reference and deduplication. See [Transfers](page:resources/transfers) for the unified transfers endpoint that handles payments.<br><br>**Default**: `'d4b6f130-1d1c-4ce2-903a-0c1ad128f55e'`<br><br>**Constraints**: *Maximum Length*: `50` |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `purpose` | `String` | Optional | Purpose tag attached to a payment quote. Used by the platform for reporting categorization and, where the program enables it, by the tax-services calculation pipeline. The value is recorded on the resulting [receipt](page:resources/receipts) and surfaces on statements. See [Transfers](page:resources/transfers) for how purpose flows through the quote / accept lifecycle. |
| `transfer_type` | [`TransferType`](../../doc/models/transfer-type.md) | Required | Discriminator value identifying this as a payment quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
portal_payment_job_quote = PortalPaymentJobQuote.new(
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  amount: '11.02',
  client_payment_ref: 'd4b6f130-1d1c-4ce2-903a-0c1ad128f55e',
  transfer_type: TransferType::PAYMENT,
  note: 'string',
  memo: 'string',
  purpose: 'BONUS',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

