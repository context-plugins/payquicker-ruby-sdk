
# Invitation Job Item Base

A single invitation row within an [Invitation Job](page:resources/invitation-jobs), combining the invitation properties with job-specific context (parent job association, row index, validation outcome). One row corresponds to one CSV line in the original batch submission.

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobItemBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Optional, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `key` | `String` | Required | Auto-generated unique identifier of the invitation, used in an invitation URL<br><br>**Constraints**: *Minimum Length*: `0`, *Maximum Length*: `256` |
| `url` | `String` | Required | Url used to begin or continue registration for a user<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `500` |
| `status` | `String` | Required | Lifecycle status of an [Invitation](page:resources/invitations) — values include `PENDING` (sent, not yet used), `USED` (the payee has registered), `CANCELLED` (revoked before use), and `EXPIRED`. Subscribe to the `INVITATIONS.CREATED` / `INVITATIONS.CANCELLED` / `INVITATIONS.USED` webhook namespaces for status-change notifications. |
| `registration_status` | `String` | Required | Progress of the payee's registration through a Hosted Portal invitation — for example, `NOT_STARTED`, `IN_PROGRESS`, `COMPLETED`. Tracked alongside the invitation's status to give a finer view of where the payee is in the onboarding flow. Mirrored in the `USERS.UPDATED.STATUS.REGISTRATIONINPROGRESS` and `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE` webhook events. |
| `currency` | `String` | Optional | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `program_user_id` | `String` | Required | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `email` | `String` | Required | Contact email address for the user account.<br><br>**Constraints**: *Minimum Length*: `8`, *Maximum Length*: `100`, *Pattern*: `^.+@.+\..+` |
| `user_token` | `String` | Optional | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `notify_user` | `TrueClass \| FalseClass` | Optional | Indicates whether invitation should be held for notification until a subsequent invitation call releases the invitation. Useful for business logic to stage an invitation. |
| `issue_card` | `TrueClass \| FalseClass` | Optional | Indicates whether a prepaid card should be issued automatically at the completion of registration. |
| `first_name` | `String` | Optional | First name<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `100` |
| `last_name` | `String` | Optional | Last name<br><br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `100` |
| `language` | `String` | Optional | Language type in IETF's BCP 47 format. See [Supported Languages](page:additional-api-information/supported-languages) for the full list.<br><br>**Default**: `'en-US'` |
| `user_type` | `String` | Optional | Profile type of a user — either `INDIVIDUAL` (a natural person) or `BUSINESS` (a legal entity, with associated contact roles). Determines which set of profile fields is applicable on the [User](page:resources/users) record. |
| `date_of_birth` | `Date` | Optional | Date and time of birth in ISO 8601 format |
| `addresses` | [`Array[AddressObject]`](../../doc/models/address-object.md) | Optional | Invitation addresses. |
| `phone_numbers` | [`Array[PhoneNumberObject]`](../../doc/models/phone-number-object.md) | Optional | Invitation phone numbers. |
| `primary_user_token` | `String` | Optional | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `job_token` | `String` | Required | Token of the parent invitation job |
| `job_portal_id` | `String` | Required | Portal identifier of the parent invitation job |
| `line_number` | `Integer` | Required | Line number of this item in the original job file |
| `exceptions` | [`Array[InvitationJobItemException]`](../../doc/models/invitation-job-item-exception.md) | Optional | Validation or processing exceptions for this item |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_item_base = InvitationJobItemBase.new(
  program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
  key: '<INVITATION_KEY>',
  url: 'https://tenant.mypayquicker.build/Welcome?invitationId=<INVITATION_KEY>',
  status: 'PENDING',
  registration_status: 'NOT_STARTED',
  created_at: DateTimeHelper.from_rfc3339('2026-02-07T22:23:09Z'),
  program_user_id: '00f1537c-963e-4b9a-98ce-c496255002d5',
  email: 'marcel74@payquicker.testinator.com',
  job_token: 'jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c',
  job_portal_id: 'ARCL1B6I34CMVKLC0',
  line_number: 1,
  token: 'invt-7f09b8e6-59d3-4c53-8a6f-8cdb1403b97d',
  currency: 'USD',
  user_token: 'userToken6',
  notify_user: false,
  issue_card: false,
  first_name: 'Marcel',
  last_name: 'Glover',
  language: 'en-US',
  user_type: 'INDIVIDUAL',
  date_of_birth: Date.iso8601('1985-04-15'),
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
  primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
  exceptions: nil,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

