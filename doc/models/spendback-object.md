
# Spendback Object

A spendback record — funds debited from the payee for goods or services purchased from the payer, returned with HATEOAS navigation links. Created via [`POST /transfers`](page:resources/transfers) with `transferType: SPENDBACK`. See [Spend Options](page:concepts/spend-options).

*This model accepts additional fields of type Object.*

## Structure

`SpendbackObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Optional, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `formatted_amount` | `String` | Required, Read-only | Allocated money to be sent in the transaction. |
| `client_spendback_ref` | `String` | Required | Unique value provided by the client for the spendback<br><br>**Constraints**: *Maximum Length*: `50` |
| `acceptance_mode` | `String` | Optional | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `destination_token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `fee` | [`FeeConfiguration`](../../doc/models/fee-configuration.md) | Optional, Read-only | Fee configuration including category and distribution details |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `quote_status` | `String` | Required, Read-only | Lifecycle status of the quote itself (e.g., PENDING_ACCEPTANCE, ACCEPTED, CANCELLED). This reflects whether the quote has been accepted, cancelled, or is still pending — not the status of the resulting transaction. See [Quote Status Types](page:additional-api-information/quote-status-types) for details. |
| `receipt_status` | `String` | Optional, Read-only | Status of the underlying receipt (transaction) that was created when this quote was accepted. This field is only populated after the quote has been accepted and a receipt exists. When the quote is still pending or has been cancelled, this field is null. See [Receipt Status Types](page:additional-api-information/receipt-status-types) for the full list of possible values. |
| `receipt_token` | `String` | Optional, Read-only | Auto-generated unique identifier representing a receipt, prefixed with `rcpt-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^rcpt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `remaining_balance` | `String` | Optional, Read-only | Money remaining after a transaction, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision)) |
| `refunds` | [`Array[SpendbackRefundObject]`](../../doc/models/spendback-refund-object.md) | Optional, Read-only | Array of refund transactions associated with this spendback |
| `transfer_type` | [`TransferType4`](../../doc/models/transfer-type-4.md) | Required, Read-only | Discriminator value identifying this as a spendback quote. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_object = SpendbackObject.new(
  token: 'spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
  amount: '0.50',
  formatted_amount: '$0.50 USD',
  client_spendback_ref: 'f48e4b082063492bb6e7d35408d98f83',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:01:40.0000000Z'),
  currency: 'USD',
  destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
  quote_status: 'ACCEPTED',
  transfer_type: TransferType4::SPENDBACK,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/spend-back/spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  portal_id: 'FOCL1BEC8SCDNJ2YW',
  acceptance_mode: 'AUTO_ACCEPT',
  fee: FeeConfiguration.new(
    category: 'COMPANY',
    distribution: [],
    source: 'TRANSACTION',
    total_amount: '0.50',
    transaction_amount: '0.50',
    type: 'SPENDBACK_PROCESSING_FEE',
    value_amount: '0.00',
    value_type: 'PERCENTAGE',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  memo: 'Order',
  note: 'Customer purchased company merchandise',
  receipt_status: 'COMPLETE',
  receipt_token: 'rcpt-401e7533-b973-4da6-baae-e336e540da2a',
  remaining_balance: '0.00',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

