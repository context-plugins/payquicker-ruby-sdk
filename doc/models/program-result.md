
# Program Result

Program result response combining program object and metadata

*This model accepts additional fields of type Object.*

## Structure

`ProgramResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `bank` | `String` | Required | Bank sponsoring the program or associated with a financial instrument. |
| `type` | `String` | Required | The type of program - `COMMERCIAL`, `CONSUMER_LOYALTY`, `CONSUMER_DISBURSEMENT` or `CONSUMER_GPR`. |
| `accounts` | [`Array[AccountObject]`](../../doc/models/account-object.md) | Optional, Read-only | Company accounts associated with this program |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
program_result = ProgramResult.new(
  token: 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb',
  currency: 'USD',
  bank: 'SPONSER_BANK',
  type: 'COMMERCIAL',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
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
  accounts: [
    AccountObject.new(
      token: 'token4',
      bank: 'bank8',
      currency: 'currency0',
      program_token: 'programToken2',
      portal_id: 'portalId8',
      capabilities: [
        'capabilities1',
        'capabilities0'
      ],
      links: {
        'key0' => nil
      },
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    AccountObject.new(
      token: 'token4',
      bank: 'bank8',
      currency: 'currency0',
      program_token: 'programToken2',
      portal_id: 'portalId8',
      capabilities: [
        'capabilities1',
        'capabilities0'
      ],
      links: {
        'key0' => nil
      },
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    AccountObject.new(
      token: 'token4',
      bank: 'bank8',
      currency: 'currency0',
      program_token: 'programToken2',
      portal_id: 'portalId8',
      capabilities: [
        'capabilities1',
        'capabilities0'
      ],
      links: {
        'key0' => nil
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

