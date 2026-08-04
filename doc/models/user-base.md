
# User Base

User — a payee on a PayQuicker program. Hosted Portal programs onboard users via [invitations](page:resources/invitations); API Gateway programs create users directly via `POST /users`. The same record carries shared profile fields (name, email, addresses, phone) plus type-specific fields for `INDIVIDUAL` vs `BUSINESS` users (nullable and omitted from responses when not applicable). See [Users](page:resources/users).

*This model accepts additional fields of type Object.*

## Structure

`UserBase`

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
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_base = UserBase.new(
  token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:59:08.0000000Z'),
  status: 'ACTIVE',
  program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
  program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
  email: 'edd_glover44@payquicker.testinator.com',
  first_name: 'Edd',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('2000-05-03'),
  user_type: 'INDIVIDUAL',
  language: 'en-US',
  addresses: [
    AddressObject.new(
      address_type: 'RESIDENTIAL',
      address_line1: '2083 Crona Walks',
      city: 'Deangelomouth',
      region: 'VA',
      postal_code: '51456',
      country: 'US',
      address_line2: 'Suite 443',
      address_line3: 'Deangelomouth VA  51456'
    ),
    AddressObject.new(
      address_type: 'MAILING',
      address_line1: '9307 Kris Haven',
      city: 'New Darrion',
      region: 'SC',
      postal_code: '65707',
      country: 'US',
      address_line2: 'Suite 010'
    )
  ],
  phone_numbers: [
    PhoneNumberObject.new(
      number: '+15852282715',
      country: 'US',
      number_type: 'PRIMARY'
    ),
    PhoneNumberObject.new(
      number: '+15852282715',
      country: 'US',
      number_type: 'MOBILE'
    )
  ],
  gender: 'NOT_SPECIFIED',
  country_of_birth: 'US',
  country_of_nationality: 'US',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

