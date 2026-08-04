
# Program Object

A [Program](page:resources/programs) record — the read-only top-level configuration provisioned by PayQuicker that determines which money-movement, instrument, and onboarding capabilities are enabled. The `programType` selects between Hosted Portal and Gateway. See [Program Types](page:concepts/program-types).

*This model accepts additional fields of type Object.*

## Structure

`ProgramObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `bank` | `String` | Required | Bank sponsoring the program or associated with a financial instrument. |
| `type` | `String` | Required | The type of program - `COMMERCIAL`, `CONSUMER_LOYALTY`, `CONSUMER_DISBURSEMENT` or `CONSUMER_GPR`. |
| `accounts` | [`Array[AccountObject]`](../../doc/models/account-object.md) | Optional, Read-only | Company accounts associated with this program |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
program_object = ProgramObject.new(
  token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
  currency: 'USD',
  bank: 'SUTTON',
  type: 'COMMERCIAL',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/programs/prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  accounts: [
    AccountObject.new(
      token: 'acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
      bank: 'SUTTON',
      currency: 'USD',
      program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
      portal_id: '5a9aeefdb1034a41bc6dfea6a6a709a8',
      capabilities: [
        'PAYMENT_SOURCE',
        'SPENDBACK_TARGET'
      ],
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/accounts/acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        ),
        'program' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/programs/prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
          method: 'GET',
          title: 'Program',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

