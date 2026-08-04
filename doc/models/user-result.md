
# User Result

User result response combining user object and metadata

*This model accepts additional fields of type Object.*

## Structure

`UserResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Optional | User token. Format `user-<uuid>`. See [Tokens](page:concepts/working-with-tokens) for the prefix list and [Scope Discriminator](page:concepts/scope-discriminator) for how user tokens vs `programUserId` + `email` are used to address payees. |
| `created_at` | `DateTime` | Optional | Timestamp of user creation. ISO 8601 format. |
| `status` | `String` | Optional | User account lifecycle status (e.g., `ACTIVE`, `PENDING`, `SUSPENDED`, `CLOSED`). See [User Status Types](page:additional-api-information/user-status-types) for the full list and what each value means. |
| `program_token` | `String` | Optional | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Optional | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Optional | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `first_name` | `String` | Optional | First name<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `100` |
| `last_name` | `String` | Optional | Last name<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `100` |
| `date_of_birth` | `Date` | Optional | Date and time of birth in ISO 8601 format |
| `user_type` | `String` | Optional | Profile type of a user — either `INDIVIDUAL` (a natural person) or `BUSINESS` (a legal entity, with associated contact roles). Determines which set of profile fields is applicable on the [User](page:resources/users) record. |
| `language` | `String` | Optional | Language type in IETF's BCP 47 format. See [Supported Languages](page:additional-api-information/supported-languages) for the full list.<br><br>**Default**: `'en-US'` |
| `addresses` | [`Array[AddressObject]`](../../doc/models/address-object.md) | Optional | User addresses. |
| `phone_numbers` | [`Array[PhoneNumberObject]`](../../doc/models/phone-number-object.md) | Optional | User phone numbers. |
| `primary_user_token` | `String` | Optional | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `gender` | `String` | Optional | Gender as a user self-identifies. Optional on user creation; captured for KYC and reporting where required by jurisdiction. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `country_of_birth` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `country_of_nationality` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `tax_resident_status` | `String` | Optional | Tax-residency status of a user, used by the platform's tax-services pipeline (where the program enables it) and by jurisdictional reporting. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `government_id_type` | `String` | Optional | Indicates the type of government ID submitted for user verification purposes. See [Government ID Types](page:additional-api-information/government-id-types) for the full list. |
| `government_id` | `String` | Optional | Government-issued identification number with a maximum length of 20 characters<br><br>**Constraints**: *Maximum Length*: `20` |
| `occupation_title` | `String` | Optional | Job title or occupation<br><br>**Constraints**: *Maximum Length*: `20` |
| `occupation_type` | `String` | Optional | Occupation category recorded on a [user](page:resources/users) profile. Used in KYC and reporting. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `contact_role` | `String` | Optional | Role of a business-user's contact — for example, `OWNER`, `MANAGER`, `OFFICER`. Used on `BUSINESS` user types to identify the natural person responsible for the business relationship. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list.<br><br>**Constraints**: *Maximum Length*: `20` |
| `business_name` | `String` | Optional | Registered business name (BUSINESS only). |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_result = UserResult.new(
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
  token: 'token2',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  status: 'status6',
  program_token: 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
  first_name: 'John',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('1977-12-14'),
  user_type: 'BUSINESS',
  language: 'cs-CZ',
  primary_user_token: 'user-2bbfc967-d12e-4647-a887-d905172fb4bc',
  gender: 'FEMALE',
  country_of_birth: 'US',
  country_of_nationality: 'US',
  tax_resident_status: 'NO',
  government_id_type: 'CURP',
  government_id: 'string',
  occupation_title: 'string',
  occupation_type: 'ARTS',
  contact_role: 'MANAGER',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

