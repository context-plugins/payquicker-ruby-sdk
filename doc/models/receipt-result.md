
# Receipt Result

Receipt result response combining receipt object and metadata

*This model accepts additional fields of type Object.*

## Structure

`ReceiptResult`

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
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_result = ReceiptResult.new(
  token: 'token4',
  type: 'type8',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  sign: 'sign6',
  source_token: 'sourceToken2',
  portal_id: 'portalId0',
  amount: 'amount4',
  formatted_amount: 'formattedAmount4',
  currency: 'currency2',
  status: 'status6',
  description: 'string',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  destination_token: 'destinationToken0',
  program_user_id: 'programUserId2',
  email: 'email4',
  delivery_details: DeliveryDetails.new(
    minimum_delivery_minutes: 4,
    maximum_delivery_minutes: 152,
    expected_delivery: 'expectedDelivery6',
    expected_delivery_time: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  details: ReceiptDetails.new(
    bank_account_id: 'bankAccountId0',
    bank_account_id_type: 'bankAccountIdType8',
    bank_name: 'bankName6',
    bank_id: 'bankId0',
    bank_id_type: 'bankIdType0',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

