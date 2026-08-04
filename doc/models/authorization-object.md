
# Authorization Object

Authorization — a pending card transaction. A merchant has authorized a charge against one of the program's prepaid cards but the transaction has not yet settled; funds are reserved against the card until settlement, at which point a [Receipt](page:resources/receipts) replaces this authorization. Authorizations are a top-level transactional resource peer to [Transfers](page:resources/transfers). See [Authorizations](page:resources/authorizations).

*This model accepts additional fields of type Object.*

## Structure

`AuthorizationObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `type` | `String` | Required | Kind of card-transaction authorization (e.g., purchase, ATM withdrawal, refund). See [Card Status Types](page:additional-api-information/card-status-types) and the [Authorizations](page:resources/authorizations) resource for the value semantics. |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `sign` | `String` | Required | Direction of a [Receipt](page:resources/receipts) amount relative to the account that owns it — `CREDIT` (funds flowed into the account), `DEBIT` (funds flowed out), or `UNDEFINED`. Used to interpret receipt amounts on a per-account basis — the same money movement produces a `CREDIT` receipt on one side and a `DEBIT` receipt on the other. |
| `source_token` | `String` | Required | Token of the prepaid card the merchant authorized against (`dest-` prefix).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `amount` | `String` | Required | Allocated money to be sent in the transaction, represented as a string to preserve decimal precision. On transfer-quote responses this value is **always non-negative**, regardless of transfer direction. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative)) |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `status` | `String` | Required | Status of the underlying receipt (transaction) that was created when this quote was accepted. This field is only populated after the quote has been accepted and a receipt exists. When the quote is still pending or has been cancelled, this field is null. See [Receipt Status Types](page:additional-api-information/receipt-status-types) for the full list of possible values. |
| `description` | `String` | Required | Localized description of the authorization, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `auth_date` | `DateTime` | Required | Date that the auth was created |
| `reference` | `String` | Required | Merchant or network reference for the authorization, when available. Useful for reconciling an authorization with the corresponding entry in the cardholder's merchant statement. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
authorization_object = AuthorizationObject.new(
  type: 'PURCHASE',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:54:32.0000000Z'),
  sign: 'DEBIT',
  source_token: 'dest-8a3e8d5c-f799-4b41-9f05-11bbd4b552bb',
  amount: '-42.99',
  currency: 'USD',
  status: 'PENDING',
  description: 'Authorization at AMAZON.COM',
  auth_date: DateTimeHelper.from_rfc3339('2026-05-02T22:54:32.0000000Z'),
  reference: '742937851234',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

