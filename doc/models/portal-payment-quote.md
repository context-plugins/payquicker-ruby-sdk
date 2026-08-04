
# Portal Payment Quote

Quote returned by `POST /transfers` with `transferType: PAYMENT` for a Hosted Portal program — captures the requested amount, exchange rate, fees, expected delivery, and the resulting `PENDING_ACCEPTANCE` quote token. Accept with `POST /transfers/{token}/accept` (or use `acceptanceMode: AUTO_ACCEPT` to accept on creation). See [Transfers](page:resources/transfers) and [Quote Status Types](page:additional-api-information/quote-status-types).

*This model accepts additional fields of type Object.*

## Structure

`PortalPaymentQuote`

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
| `acceptance_mode` | `String` | Required | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `not_before` | `DateTime` | Optional | Transfer is scheduled and will not process before this time. ISO 8601 format. |
| `not_after` | `DateTime` | Optional | Transfer expires if not accepted prior to this time. ISO 8601 format. |
| `transfer_type` | [`TransferType`](../../doc/models/transfer-type.md) | Required | Discriminator value identifying this as a payment quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
portal_payment_quote = PortalPaymentQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  program_user_id: 'PQAPI-a6f83b0f903fc540ee1cb41ed137983c',
  email: 'alberta7@payquicker.testinator.com',
  amount: '2.00',
  client_payment_ref: '2d8a3d44a9194d3ea87a2c99154e8523',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType::PAYMENT,
  note: 'note8',
  memo: 'Q2 incentive',
  purpose: 'BONUS',
  not_before: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  not_after: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

