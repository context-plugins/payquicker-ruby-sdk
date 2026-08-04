
# Card Result

Prepaid card result response combining prepaid card object and metadata

*This model accepts additional fields of type Object.*

## Structure

`CardResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Optional, Read-only | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `card_network` | `String` | Required, Read-only | Card network on which a [prepaid card](page:resources/prepaid-cards) is issued — for example, `MASTER_CARD` or `VISA`. The network affects acceptance, mobile-wallet eligibility, and the regulatory rules under which authorizations are processed. |
| `card_number` | `String` | Required, Read-only | Unique number on the prepaid card |
| `card_package` | `String` | Required, Read-only | Identifier of the card package that governs the physical artwork, packaging, and shipping for a [prepaid card](page:resources/prepaid-cards). Card packages are configured per-program and assigned at card order; consult your PayQuicker representative for the package identifiers available to your program. |
| `country` | `String` | Required, Read-only | Throughout the PayQuicker API, the usage of the 2-letter alpha code is used in place of the country name, e.g., for bank country or residential country. The 2-letter codes adhere to the ISO 3166-1 spec and are listed here for convenience. |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `cvv` | `String` | Optional, Read-only | Three- or four-digit Card Verification Value (CVV) number displayed on the back of a credit or debit card |
| `expires` | `String` | Optional, Read-only | Date and time at which the object expires. ISO 8601 format. |
| `status` | `String` | Required, Read-only | Current status of the [prepaid card](page:resources/prepaid-cards). See [Card Status Types](page:additional-api-information/card-status-types) for the full list of statuses and allowed transitions. |
| `bank_in_details` | [`Array[BankAccountField]`](../../doc/models/bank-account-field.md) | Optional, Read-only | Bank account details for loading funds onto the card |
| `capabilities` | `Array[String]` | Optional, Read-only | Available card capabilities and features |
| `user_token` | `String` | Required, Read-only | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
card_result = CardResult.new(
  token: 'token6',
  card_network: 'cardNetwork0',
  card_number: 'cardNumber6',
  card_package: 'cardPackage8',
  country: 'country4',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  currency: 'currency0',
  status: 'status2',
  user_token: 'userToken0',
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
  program_user_id: 'programUserId6',
  cvv: 'cvv8',
  expires: 'expires8',
  bank_in_details: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: 'string',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  capabilities: [
    'APPLEPAY'
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

