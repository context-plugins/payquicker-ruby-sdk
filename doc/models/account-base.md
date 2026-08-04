
# Account Base

A program-level account — typically the company's funding account or clearing account, identified by `acct-` token. Carries the configured currency, bank issuer, and capabilities (e.g., `PAYMENT_SOURCE`, `SPENDBACK_DESTINATION`) that gate which money-movement operations the account can participate in. See [Accounts](page:resources/accounts) for the resource overview.

*This model accepts additional fields of type Object.*

## Structure

`AccountBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Auto-generated unique identifier representing an account, prefixed with acct-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^acct-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `bank` | `String` | Required | Bank sponsoring the program or associated with a financial instrument. |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `program_token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Required, Read-only | Account identifier used in the web portal |
| `capabilities` | `Array[String]` | Required | Capabilities of this account |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
account_base = AccountBase.new(
  token: 'acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
  bank: 'SUTTON',
  currency: 'USD',
  program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
  portal_id: '5a9aeefdb1034a41bc6dfea6a6a709a8',
  capabilities: [
    'PAYMENT_SOURCE',
    'SPENDBACK_TARGET'
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

