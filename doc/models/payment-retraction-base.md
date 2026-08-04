
# Payment Retraction Base

Payment retraction quote — reverses an accepted payment by returning the funds to the source account. Conceptually similar to a payment reversal in card-acquiring or a transfer cancellation in cross-border. Created via `POST /transfers` with `transferType: RETRACTION`. Token prefix `retx-`. Follows the standard quote / accept lifecycle. See [Transfers](page:resources/transfers).

*This model accepts additional fields of type Object.*

## Structure

`PaymentRetractionBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Optional, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `amount` | `String` | Required | Money to be refunded from original payment, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision)) |
| `formatted_amount` | `String` | Required, Read-only | Combination of the amount and currency type |
| `acceptance_mode` | `String` | Optional | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `allow_partial` | `TrueClass \| FalseClass` | Optional | When `true`, the quote is automatically accepted on creation — the platform does not wait for a separate `POST /transfers/{token}/accept` call. When `false` or omitted, the quote is created in `PENDING_ACCEPTANCE` and must be accepted explicitly.<br><br>**Default**: `false` |
| `client_retraction_ref` | `String` | Required | Unique value provided by the client for the payment retraction<br><br>**Constraints**: *Maximum Length*: `50` |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `destination_token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `payment_retraction_portal_id` | `String` | Optional, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `payment_token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `client_payment_ref` | `String` | Required, Read-only | Unique value provided by the client for the payment, utilized for reference and deduplication. See [Transfers](page:resources/transfers) for the unified transfers endpoint that handles payments.<br><br>**Constraints**: *Maximum Length*: `50` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `quote_status` | `String` | Required, Read-only | Lifecycle status of the quote itself (e.g., PENDING_ACCEPTANCE, ACCEPTED, CANCELLED). This reflects whether the quote has been accepted, cancelled, or is still pending — not the status of the resulting transaction. See [Quote Status Types](page:additional-api-information/quote-status-types) for details. |
| `receipt_status` | `String` | Optional, Read-only | Status of the underlying receipt (transaction) that was created when this quote was accepted. This field is only populated after the quote has been accepted and a receipt exists. When the quote is still pending or has been cancelled, this field is null. See [Receipt Status Types](page:additional-api-information/receipt-status-types) for the full list of possible values. |
| `receipt_token` | `String` | Optional, Read-only | Auto-generated unique identifier representing a receipt, prefixed with `rcpt-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^rcpt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `transfer_type` | [`TransferType5`](../../doc/models/transfer-type-5.md) | Required, Read-only | Discriminator value identifying this as a payment retraction quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_retraction_base = PaymentRetractionBase.new(
  token: 'retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50',
  amount: '2.00',
  formatted_amount: '$2.00 USD',
  client_retraction_ref: 'c0f8bdcaf7c647d0be2ecf9e1d646cc8',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:09.0000000Z'),
  currency: 'USD',
  source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  payment_token: 'pmnt-240b953b-6276-4a1b-b982-61122bde3638',
  client_payment_ref: 'c125739e6fbb471987b474fa3527dcb5',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
  quote_status: 'PENDING_ACCEPTANCE',
  transfer_type: TransferType5::RETRACTION,
  portal_id: 'FOCL1BEC8SCDNJ307',
  acceptance_mode: 'MANUAL_ACCEPT',
  allow_partial: false,
  memo: 'Customer charge dispute',
  note: 'Funds reversed to source account',
  payment_retraction_portal_id: 'FOCL1BEC8SCDNJ306',
  receipt_status: 'COMPLETE',
  receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

