
# Idv Check Result

Identity verification check result response combining IDV check object and metadata

*This model accepts additional fields of type Object.*

## Structure

`IdvCheckResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `user_token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `idv_provider_reference` | `String` | Required | Provider-specific reference identifier for the identity-verification check. |
| `idv_result` | `String` | Required | Result type of identity verification. See [KYC Enums](page:additional-api-information/kyc-enums). |
| `idv_sub_result` | `String` | Optional | Sub-result type of identity verification — `HARD` (definitive outcome) or `SOFT` (may require manual review). See [KYC Enums](page:additional-api-information/kyc-enums). |
| `idv_provider` | `String` | Required | Provider types of identity verification that can be used for performing identity checks. See [KYC Enums](page:additional-api-information/kyc-enums). |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `raw` | `String` | Required | Raw, unprocessed output from the IDV provider for an [IDV check](page:resources/idv-checks). Surfaced for diagnostics and audit; the typed result fields on the IDV-check record are the normalized customer-facing surface. |
| `idv_check_type` | `String` | Required | Type of verification used for performing an identity check. See [IDV Checks](page:resources/idv-checks) and [KYC Enums](page:additional-api-information/kyc-enums). |
| `idv_disposition` | `String` | Required | Disposition type of identity verification. See [KYC Enums](page:additional-api-information/kyc-enums). |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
idv_check_result = IdvCheckResult.new(
  token: 'user-2bbfc967-d12e-4647-a887-d905172fb4bc',
  user_token: 'user-2bbfc967-d12e-4647-a887-d905172fb4bc',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  idv_provider_reference: 'string',
  idv_result: 'PASS',
  idv_provider: 'EQUIFAX',
  created_at: DateTimeHelper.from_rfc3339('2026-02-07T22:23:09Z'),
  raw: 'string',
  idv_check_type: 'PII',
  idv_disposition: 'FINAL',
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
  idv_sub_result: 'HARD',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

