
# Payment Job Item Object

A payment row returned from a [Payment Job](page:resources/payment-jobs)'s `/items` route, extending `PaymentJobItemBase` with HATEOAS navigation links. See [Payment Jobs](page:resources/payment-jobs).

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobItemObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Optional, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `formatted_amount` | `String` | Required, Read-only | Combination of the amount and currency type |
| `acceptance_mode` | `String` | Optional | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `client_payment_ref` | `String` | Required | Unique value provided by the client for the payment, utilized for reference and deduplication. See [Transfers](page:resources/transfers) for the unified transfers endpoint that handles payments.<br><br>**Default**: `'d4b6f130-1d1c-4ce2-903a-0c1ad128f55e'`<br><br>**Constraints**: *Maximum Length*: `50` |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `destination_token` | `String` | Optional | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `purpose` | `String` | Optional | Purpose tag attached to a payment quote. Used by the platform for reporting categorization and, where the program enables it, by the tax-services calculation pipeline. The value is recorded on the resulting [receipt](page:resources/receipts) and surfaces on statements. See [Transfers](page:resources/transfers) for how purpose flows through the quote / accept lifecycle. |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `quote_status` | `String` | Required, Read-only | Lifecycle status of the quote itself (e.g., PENDING_ACCEPTANCE, ACCEPTED, CANCELLED). This reflects whether the quote has been accepted, cancelled, or is still pending — not the status of the resulting transaction. See [Quote Status Types](page:additional-api-information/quote-status-types) for details. |
| `receipt_status` | `String` | Optional, Read-only | Status of the underlying receipt (transaction) that was created when this quote was accepted. This field is only populated after the quote has been accepted and a receipt exists. When the quote is still pending or has been cancelled, this field is null. See [Receipt Status Types](page:additional-api-information/receipt-status-types) for the full list of possible values. |
| `receipt_token` | `String` | Optional, Read-only | Auto-generated unique identifier representing a receipt, prefixed with `rcpt-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^rcpt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `not_before` | `DateTime` | Optional | Transfer is scheduled and will not process before this time. ISO 8601 format. |
| `not_after` | `DateTime` | Optional | Transfer expires if not accepted prior to this time. ISO 8601 format. |
| `transfer_type` | [`TransferType`](../../doc/models/transfer-type.md) | Required, Read-only | Discriminator value identifying this as a payment quote. |
| `job_token` | `String` | Required, Read-only | Token of the parent payment job |
| `job_portal_id` | `String` | Required, Read-only | Portal identifier of the parent payment job |
| `line_number` | `Integer` | Required, Read-only | Line number of this item in the original job file |
| `exceptions` | [`Array[PaymentJobItemException]`](../../doc/models/payment-job-item-exception.md) | Optional | Validation or processing exceptions for this item |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_item_object = PaymentJobItemObject.new(
  token: 'pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
  amount: '150.00',
  formatted_amount: '$150.00 USD',
  client_payment_ref: 'ref-001',
  created_at: DateTimeHelper.from_rfc3339('2026-04-06T13:13:24.0000000Z'),
  currency: 'USD',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'alberta.purdy@payquicker.testinator.com',
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  quote_status: 'ACCEPTED',
  transfer_type: TransferType::PAYMENT,
  job_token: 'jobs-1151378b-ec9f-44f0-8179-6d6e877430ac',
  job_portal_id: 'ARCL1BBG6RS1YK8W0',
  line_number: 1,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  portal_id: 'FOCL1BEC8SCDNJ2ZK',
  acceptance_mode: 'AUTO_ACCEPT',
  destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
  memo: 'Q2 incentive bonus',
  note: 'Job-distributed bonus',
  purpose: 'BONUS',
  receipt_status: 'COMPLETE',
  receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
  not_before: DateTimeHelper.from_rfc3339('2026-04-06T13:13:24.0000000Z'),
  not_after: DateTimeHelper.from_rfc3339('2026-05-06T13:13:24.0000000Z'),
  exceptions: nil,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

