
# Idv Check Object

`IdvCheckBase` returned with HATEOAS navigation links — the form returned in API responses. See [Users](page:resources/users) for the parent resource and [HATEOAS](page:concepts/hateoas).

*This model accepts additional fields of type Object.*

## Structure

`IdvCheckObject`

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
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
idv_check_object = IdvCheckObject.new(
  token: 'idvc-0a5152dc-b5ad-40b5-84ee-57b483136cb6',
  user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  idv_provider_reference: '142945612',
  idv_result: 'PASS',
  idv_provider: 'OFACANALYZER',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:59:03.0000000Z'),
  raw: '{"OfacId":"595132","SearchKey":"142945612","PossibleMatches":"0","SearchDate":"5/2/2026 3:59:02 PM"}',
  idv_check_type: 'SANCTIONS',
  idv_disposition: 'FINAL',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/users/user-9051a6a6-1c86-4666-8f93-79251ce7039d/idv-checks/idvc-0a5152dc-b5ad-40b5-84ee-57b483136cb6',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  idv_sub_result: 'HARD',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

