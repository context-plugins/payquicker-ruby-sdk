
# Invitation Result

Invitation result response combining invitation object and metadata

*This model accepts additional fields of type Object.*

## Structure

`InvitationResult`

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
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_result = InvitationResult.new(
  program_token: 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb',
  key: 'key6',
  url: 'url0',
  status: 'status8',
  registration_status: 'registrationStatus6',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  email: 'john.doe@email.com',
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
  token: 'token0',
  currency: 'currency6',
  user_token: 'user-2bbfc967-d12e-4647-a887-d905172fb4bc',
  notify_user: false,
  issue_card: false,
  first_name: 'John',
  last_name: 'Glover',
  language: 'cs-CZ',
  user_type: 'BUSINESS',
  date_of_birth: Date.iso8601('1977-12-14'),
  primary_user_token: 'user-2bbfc967-d12e-4647-a887-d905172fb4bc',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

