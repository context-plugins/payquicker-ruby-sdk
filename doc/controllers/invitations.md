# Invitations

# Invitations

---


The *Invitations* resource sends, manages, and tracks invitations to payees. When a payee receives an invitation, they use it to self-register through the hosted portal and set up their account. Invitations are how [Hosted Portal](page:concepts/program-types#hosted-portal-programs) programs onboard new payees.

Each invitation is identified by an `invt-` token.

> **Program type:** Hosted Portal only. API Gateway programs onboard payees by calling `POST /users` directly.

With this resource, you can perform the following requests:

* `POST /invitations` — Create an invitation
* `GET /invitations/{invitation-token}` — Fetch an invitation
* `PUT /invitations/{invitation-token}` — Update an invitation
* `DELETE /invitations/{invitation-token}` — Cancel an invitation
* `POST /invitations/search` + `GET /invitations/search/{searchId}` — Search invitations

Invitations follow the platform's standard search pattern. See [Searching](page:concepts/searching).

For more information, see [Invitations](page:resources/invitations). For a step-by-step guide, see [Onboard Users](page:howtos/onboard-users).

```ruby
invitations_api = client.invitations
```

## Class Name

`InvitationsApi`

## Methods

* [Post-Invitations](../../doc/controllers/invitations.md#post-invitations)
* [Get-Invitations-Invt Token](../../doc/controllers/invitations.md#get-invitations-invt-token)
* [Put-Invitations-Invt Token](../../doc/controllers/invitations.md#put-invitations-invt-token)
* [Delete-Invitations-Invt Token](../../doc/controllers/invitations.md#delete-invitations-invt-token)
* [Search Invitations](../../doc/controllers/invitations.md#search-invitations)
* [Read Invitation Search](../../doc/controllers/invitations.md#read-invitation-search)


# Post-Invitations

Create an [invitation](page:resources/invitations) to onboard a user through the [Hosted Portal](page:concepts/program-types#hosted-portal-programs).

**Available for Hosted Portal programs only.** API Gateway programs create users directly via [`POST /users`]($e/Users/Create%20User).

For a step-by-step guide, see [Onboard Users](page:howtos/onboard-users#path-2-send-an-invitation-hosted-portal).

```ruby
def post_invitations(body,
                     accept_language: 'en-US',
                     accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [_IndividualUserInvitation](../../doc/models/individual-user-invitation.md) \| [_BusinessUserInvitation](../../doc/models/business-user-invitation.md) | Body, Required | Polymorphic invitation request. The userType property identifies the user type and determines required fields and validation rules. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample invitation response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationResult`](../../doc/models/invitation-result.md).

## Example Usage

```ruby
body = IndividualUserInvitation.new(
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
  ]
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = invitations_api.post_invitations(
  body,
  accept_language: accept_language,
  accept_timezone: accept_timezone
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 403 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 500 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| Default | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |


# Get-Invitations-Invt Token

Fetch a single [invitation](page:resources/invitations) by its `invt-` [token](page:concepts/working-with-tokens). Returns the invitation status, recipient details, and related [navigation](page:concepts/hateoas) links.

```ruby
def get_invitations_invt_token(invitation_token,
                               accept_language: 'en-US',
                               accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invitation_token` | `String` | Template, Required | A token representing the invitation. This must be an `invt-` [token](page:concepts/working-with-tokens). For example invt-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^invt-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample invitation response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationResult`](../../doc/models/invitation-result.md).

## Example Usage

```ruby
invitation_token = 'invt-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = invitations_api.get_invitations_invt_token(
  invitation_token,
  accept_language: accept_language,
  accept_timezone: accept_timezone
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 403 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 404 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 500 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| Default | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |


# Put-Invitations-Invt Token

Update an [invitation](page:resources/invitations) that has not yet been redeemed. Allows changing recipient details or re-sending the invitation email through the [Hosted Portal](page:concepts/program-types#hosted-portal-programs).

```ruby
def put_invitations_invt_token(invitation_token,
                               body,
                               accept_language: 'en-US',
                               accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invitation_token` | `String` | Template, Required | A token representing the invitation. This must be an `invt-` [token](page:concepts/working-with-tokens). For example invt-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^invt-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `body` | [_IndividualUserInvitation](../../doc/models/individual-user-invitation.md) \| [_BusinessUserInvitation](../../doc/models/business-user-invitation.md) | Body, Required | Polymorphic invitation request. The userType property identifies the user type and determines required fields and validation rules. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample invitation response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationResult`](../../doc/models/invitation-result.md).

## Example Usage

```ruby
invitation_token = 'invt-2bbfc967-d12e-4647-a887-d905172fb4bc'

body = IndividualUserInvitation.new(
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
  ]
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = invitations_api.put_invitations_invt_token(
  invitation_token,
  body,
  accept_language: accept_language,
  accept_timezone: accept_timezone
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 403 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 500 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| Default | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |


# Delete-Invitations-Invt Token

Cancel an open [invitation](page:resources/invitations) that has not yet been redeemed. Cancelled invitations can no longer be used by the recipient to onboard through the [Hosted Portal](page:concepts/program-types#hosted-portal-programs).

```ruby
def delete_invitations_invt_token(invitation_token,
                                  accept_language: 'en-US',
                                  accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `invitation_token` | `String` | Template, Required | A token representing the invitation. This must be an `invt-` [token](page:concepts/working-with-tokens). For example invt-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^invt-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**201**: Sample invitation response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationResult`](../../doc/models/invitation-result.md).

## Example Usage

```ruby
invitation_token = 'invt-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = invitations_api.delete_invitations_invt_token(
  invitation_token,
  accept_language: accept_language,
  accept_timezone: accept_timezone
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 403 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 404 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 500 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| Default | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |


# Search Invitations

Search for [invitations](page:resources/invitations) using structured filter criteria. Invitations are a [Hosted Portal](page:concepts/program-types#hosted-portal-programs) program concept only.

```ruby
def search_invitations(body,
                       accept_language: 'en-US',
                       accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`InvitationSearchRequest`](../../doc/models/invitation-search-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample invitation list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationSearchResult`](../../doc/models/invitation-search-result.md).

## Example Usage

```ruby
body = InvitationSearchRequest.new(
  filters: [],
  sort: [],
  page: 1,
  page_size: 10
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = invitations_api.search_invitations(
  body,
  accept_language: accept_language,
  accept_timezone: accept_timezone
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 403 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 500 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| Default | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |


# Read Invitation Search

Retrieve a specific page of results from a previous invitation search request.

```ruby
def read_invitation_search(search_id,
                           page: 1,
                           page_size: nil,
                           accept_language: 'en-US',
                           accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `search_id` | `UUID \| String` | Template, Required | Search session identifier returned by the initial POST /search request. Use this value to paginate through search results via the corresponding GET /search/{searchId} endpoint. |
| `page` | `Integer` | Query, Optional | Page number to retrieve from the cached search results (1-based).<br><br>**Default**: `1`<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Query, Optional | Number of results per page (1–100).<br><br>**Constraints**: `>= 1`, `<= 100` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample invitation list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationSearchResult`](../../doc/models/invitation-search-result.md).

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = invitations_api.read_invitation_search(
  search_id,
  page: page,
  page_size: page_size,
  accept_language: accept_language,
  accept_timezone: accept_timezone
)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

## Errors

| HTTP Status Code | Error Description | Exception Class |
|  --- | --- | --- |
| 400 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 403 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 404 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| 500 | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |
| Default | API error response containing error details and status information. See [Errors](page:concepts/errors) for the error object structure and [Error Types](page:concepts/error-types) for common error codes. | [`ApiErrorResultException`](../../doc/models/api-error-result-exception.md) |

