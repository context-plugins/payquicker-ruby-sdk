
# Business User Invitation

Request for creating or updating a business invitation

*This model accepts additional fields of type Object.*

## Structure

`BusinessUserInvitation`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `program_token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `notify_user` | `TrueClass \| FalseClass` | Optional | Indicates whether invitation should be held for notification until a subsequent invitation call releases the invitation. Useful for business logic to stage an invitation. |
| `issue_card` | `TrueClass \| FalseClass` | Required | Indicates whether a prepaid card should be issued automatically at the completion of registration. |
| `first_name` | `String` | Optional | Contact person's first name for the business. |
| `last_name` | `String` | Optional | Contact person's last name for the business. |
| `date_of_birth` | `Date` | Optional | Contact person's date of birth for the business. |
| `contact_role` | `String` | Optional | Role of a business-user's contact — for example, `OWNER`, `MANAGER`, `OFFICER`. Used on `BUSINESS` user types to identify the natural person responsible for the business relationship. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list.<br><br>**Constraints**: *Maximum Length*: `20` |
| `business_name` | `String` | Optional | Registered business name. |
| `language` | `String` | Optional | Language type in IETF's BCP 47 format. See [Supported Languages](page:additional-api-information/supported-languages) for the full list.<br><br>**Default**: `'en-US'` |
| `addresses` | [`Array[AddressObject]`](../../doc/models/address-object.md) | Optional | Optional. BUSINESS addresses validated when present. |
| `phone_numbers` | [`Array[PhoneNumberObject]`](../../doc/models/phone-number-object.md) | Optional | Optional. Validated when present. |
| `user_type` | [`UserType1`](../../doc/models/user-type-1.md) | Required | Discriminator identifying this as a business invitation. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
business_user_invitation = BusinessUserInvitation.new(
  program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
  program_user_id: 'PQAPI-04567a8983e1a44a1c8d1e02ab3f9b21',
  email: 'ops@acmemerch.com',
  issue_card: false,
  user_type: UserType1::BUSINESS,
  notify_user: true,
  first_name: 'Marcel',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('1985-04-15'),
  contact_role: 'AUTHORIZED_SIGNER',
  business_name: 'ACME Merchandise LLC',
  language: 'en-US',
  addresses: [
    AddressObject.new(
      address_type: 'BUSINESS',
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
      number_type: 'BUSINESS'
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

