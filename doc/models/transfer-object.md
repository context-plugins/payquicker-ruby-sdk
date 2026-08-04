
# Transfer Object

A [Transfer](page:resources/transfers) — the unified money-movement record covering payments, spendbacks, retractions, refunds, and bank/card/u2u transfers, returned with HATEOAS navigation links. The `transferType` discriminator distinguishes the variant. See [Transfers](page:resources/transfers) and [Transfer Types](page:additional-api-information/transfer-types).

*This model accepts additional fields of type Object.*

## Structure

`TransferObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Optional, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `client_transfer_ref` | `String` | Required | Unique value provided by the client for the transfer, utilized for reference and deduplication.<br><br>**Constraints**: *Maximum Length*: `50` |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `delivery_details` | [`DeliveryDetails`](../../doc/models/delivery-details.md) | Optional, Read-only | The delivery details of a Bank transfer with the minimum and maximum delivery in minutes or the expected delivery time. |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction — direction is conveyed by `transferType`, not by sign. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `formatted_amount` | `String` | Required, Read-only | Combination of the amount and currency type |
| `acceptance_mode` | `String` | Optional | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `destination_token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Default**: `'dest-631b200f-665d-4dbe-bd01-3063c9dec97d'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `fee` | [`FeeConfiguration`](../../doc/models/fee-configuration.md) | Optional, Read-only | Fee configuration including category and distribution details |
| `fx_rate` | [`FxRate`](../../doc/models/fx-rate.md) | Optional, Read-only | Exchange rate |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `quote_status` | `String` | Required, Read-only | Lifecycle status of the quote itself (e.g., PENDING_ACCEPTANCE, ACCEPTED, CANCELLED). This reflects whether the quote has been accepted, cancelled, or is still pending — not the status of the resulting transaction. See [Quote Status Types](page:additional-api-information/quote-status-types) for details. |
| `receipt_status` | `String` | Optional, Read-only | Status of the underlying receipt (transaction) that was created when this quote was accepted. This field is only populated after the quote has been accepted and a receipt exists. When the quote is still pending or has been cancelled, this field is null. See [Receipt Status Types](page:additional-api-information/receipt-status-types) for the full list of possible values. |
| `receipt_token` | `String` | Optional, Read-only | **Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^rcpt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `lockside` | `String` | Optional | Type of [lockside](page:additional-api-information/transfer-lockside-types) for transfers. |
| `method` | `String` | Optional | Underlying rail used to settle a `transferType: TRANSFER` to a bank-account or electronic-wallet [Instrument](page:resources/instruments). Examples: `IACH` (international ACH), `WIRE`, `LOCAL`. Available methods depend on the destination's country and currency — discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the full list. |
| `transfer_type` | [`TransferType7`](../../doc/models/transfer-type-7.md) | Required, Read-only | Discriminator value identifying this as a transfer quote. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
transfer_object = TransferObject.new(
  token: 'xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
  client_transfer_ref: 'c23a4e8c-7f0f-47ea-b833-fc985e01051d',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:34.0000000Z'),
  amount: '-0.01',
  formatted_amount: '($0.01) USD',
  currency: 'USD',
  destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  program_user_id: 'PQAPI-01866a624144f0e5f05e18de0c72d8a9',
  email: 'dyn1bec8scdnj2z4__neva_block@payquicker.testinator.com',
  quote_status: 'ACCEPTED',
  transfer_type: TransferType7::TRANSFER,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/transfers/xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  portal_id: 'FOCL1BEC8SCDNJ2ZM',
  delivery_details: DeliveryDetails.new(
    minimum_delivery_minutes: 4,
    maximum_delivery_minutes: 152,
    expected_delivery: 'SAME_DAY',
    expected_delivery_time: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  acceptance_mode: 'MANUAL_ACCEPT',
  fee: FeeConfiguration.new(
    category: 'COMPANY',
    distribution: [],
    source: 'TRANSACTION',
    total_amount: '0.00',
    transaction_amount: '0.00',
    type: 'BANK_TRANSFER',
    value_amount: '0.00',
    value_type: 'PERCENTAGE',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  fx_rate: FxRate.new(
    destination_amount: '-0.01',
    destination_currency: 'USD',
    destination_formatted_amount: '($0.01) USD',
    rate: '1.00',
    source_amount: '-0.01',
    source_currency: 'USD',
    source_formatted_amount: '($0.01) USD',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  memo: 'Q1 incentive transfer',
  note: 'Reissued after retraction',
  receipt_status: 'COMPLETE',
  receipt_token: 'rcpt-0838989a-7a5c-4e87-8466-ed1a7d31d9c0',
  lockside: 'SOURCE',
  method: 'ACCOUNT_TO_ACCOUNT_TRANSFER',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

