
# Individual User Invitation

Request for creating or updating an individual invitation

*This model accepts additional fields of type Object.*

## Structure

`IndividualUserInvitation`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `program_token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `notify_user` | `TrueClass \| FalseClass` | Optional | Indicates whether invitation should be held for notification until a subsequent invitation call releases the invitation. Useful for business logic to stage an invitation. |
| `issue_card` | `TrueClass \| FalseClass` | Required | Indicates whether a prepaid card should be issued automatically at the completion of registration. |
| `first_name` | `String` | Optional | First name<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `100` |
| `last_name` | `String` | Optional | Last name<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `100` |
| `date_of_birth` | `Date` | Optional | Date and time of birth in ISO 8601 format |
| `gender` | `String` | Optional | Gender as a user self-identifies. Optional on user creation; captured for KYC and reporting where required by jurisdiction. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `language` | `String` | Optional | Language type in IETF's BCP 47 format. See [Supported Languages](page:additional-api-information/supported-languages) for the full list.<br><br>**Default**: `'en-US'` |
| `country_of_birth` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `country_of_nationality` | `String` | Optional | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `tax_resident_status` | `String` | Optional | Tax-residency status of a user, used by the platform's tax-services pipeline (where the program enables it) and by jurisdictional reporting. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `government_id_type` | `String` | Optional | Indicates the type of government ID submitted for user verification purposes. See [Government ID Types](page:additional-api-information/government-id-types) for the full list. |
| `government_id` | `String` | Optional | Government-issued identification number with a maximum length of 20 characters<br><br>**Constraints**: *Maximum Length*: `20` |
| `occupation_title` | `String` | Optional | Job title or occupation<br><br>**Constraints**: *Maximum Length*: `20` |
| `occupation_type` | `String` | Optional | Occupation category recorded on a [user](page:resources/users) profile. Used in KYC and reporting. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `primary_user_token` | `String` | Optional | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `addresses` | [`Array[AddressObject]`](../../doc/models/address-object.md) | Optional | Optional. INDIVIDUAL addresses validated when present. |
| `phone_numbers` | [`Array[PhoneNumberObject]`](../../doc/models/phone-number-object.md) | Optional | Optional. Validated when present. |
| `user_type` | [`UserType`](../../doc/models/user-type.md) | Required | Discriminator identifying this as an individual invitation. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
individual_user_invitation = IndividualUserInvitation.new(
  program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
  program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
  email: 'marcel74@payquicker.testinator.com',
  issue_card: false,
  user_type: UserType::INDIVIDUAL,
  notify_user: true,
  first_name: 'Marcel',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('1985-04-15'),
  gender: 'MALE',
  language: 'en-US',
  country_of_birth: 'US',
  country_of_nationality: 'US',
  tax_resident_status: 'RESIDENT',
  government_id_type: 'SSN',
  government_id: '123-45-6789',
  occupation_title: 'Software Engineer',
  occupation_type: 'TECHNOLOGY',
  primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
  addresses: [
    AddressObject.new(
      address_type: 'RESIDENTIAL',
      address_line1: '2083 Crona Walks',
      city: 'Deangelomouth',
      region: 'VA',
      postal_code: '51456',
      country: 'US',
      address_line2: 'Suite 443'
    )
  ],
  phone_numbers: [
    PhoneNumberObject.new(
      number: '+15852282715',
      country: 'US',
      number_type: 'MOBILE'
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

