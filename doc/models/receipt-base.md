
# Receipt Base

Receipt — a settled transaction on the platform. Created when a transfer quote is accepted (`POST /transfers/{token}/accept`), a prepaid-card authorization clears, or a fee posts to an account. The receipt records the parties, the amount, the timing, and the terminal status of the underlying transaction. Token prefix `rcpt-`. See [Receipts](page:resources/receipts).

*This model accepts additional fields of type Object.*

## Structure

`ReceiptBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Auto-generated unique identifier representing a receipt, prefixed with `rcpt-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^rcpt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `type` | `String` | Required, Read-only | Granular type tag on a receipt — identifies the underlying transactional category (e.g. `PAYMENT`, `SPENDBACK`, `BANK_TRANSFER`, `PREPAID_CARD_PURCHASE`, `FEE`). See [Transfer Types](page:additional-api-information/transfer-types). |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `sign` | `String` | Required, Read-only | Direction of the receipt's amount relative to the account that owns it. `CREDIT` means funds flowed into the account; `DEBIT` means funds flowed out. Used to interpret receipt amounts on a per-account basis — the same money movement produces a `CREDIT` receipt on one side and a `DEBIT` receipt on the other. |
| `source_token` | `String` | Required, Read-only | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `destination_token` | `String` | Optional, Read-only | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Optional, Read-only | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Optional, Read-only | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `portal_id` | `String` | Required, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `amount` | `String` | Required, Read-only | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision)) |
| `formatted_amount` | `String` | Required, Read-only | Allocated money to be sent in the transaction. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `status` | `String` | Required, Read-only | Status of the underlying receipt (transaction) that was created when this quote was accepted. This field is only populated after the quote has been accepted and a receipt exists. When the quote is still pending or has been cancelled, this field is null. See [Receipt Status Types](page:additional-api-information/receipt-status-types) for the full list of possible values. |
| `description` | `String` | Required, Read-only | Localized description of the receipt, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `delivery_details` | [`DeliveryDetails`](../../doc/models/delivery-details.md) | Optional, Read-only | The delivery details of a Bank transfer with the minimum and maximum delivery in minutes or the expected delivery time. |
| `details` | [`ReceiptDetails`](../../doc/models/receipt-details.md) | Optional, Read-only | Detailed information about a receipt including bank account and branch details |
| `fx_rate` | [`FxRate`](../../doc/models/fx-rate.md) | Optional, Read-only | Exchange rate |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_base = ReceiptBase.new(
  token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
  type: 'PAYMENT_RETRACTION',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:37.0000000Z'),
  sign: 'DEBIT',
  source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  portal_id: 'FOCL1BEC8SCDNJ31J',
  amount: '-2.00',
  formatted_amount: '($2.00) USD',
  currency: 'USD',
  status: 'COMPLETE',
  description: 'Retraction for FOCL1BEC8SCDNJ31G',
  destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'alberta.purdy@payquicker.testinator.com',
  delivery_details: DeliveryDetails.new(
    minimum_delivery_minutes: 4,
    maximum_delivery_minutes: 152,
    expected_delivery: 'SAME_DAY',
    expected_delivery_time: DateTimeHelper.from_rfc3339('0001-01-01T21:00:00Z'),
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  details: ReceiptDetails.new(
    bank_account_id: '021000021',
    bank_account_id_type: 'BANK_ACH_ABA',
    bank_name: 'JPMorgan Chase Bank',
    bank_id: '021000021',
    bank_id_type: 'BANK_ACH_ABA',
    beneficary_name: 'Alberta Purdy',
    memo: 'Retraction for original payment',
    note: 'Retraction Initiated By Company',
    correlation_token: 'pmnt-7d631de0-3467-4ece-b408-29dc748ed615',
    processor_reference: 'c3c600111b62426797e8596bd1dcaa5f',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  fx_rate: FxRate.new(
    destination_amount: '-2.00',
    destination_currency: 'USD',
    destination_formatted_amount: '($2.00) USD',
    rate: '1.00',
    source_amount: '-2.00',
    source_currency: 'USD',
    source_formatted_amount: '($2.00) USD'
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

