# Agreements

# Agreements

---


Agreements are legal documents that users must accept as part of opening and maintaining an account with PayQuicker — terms of service, fee schedules, privacy policy, e-sign consent, and similar regulatory documents. A user with unaccepted required agreements may not be fully activated.

Agreements are owned by a [Program](page:resources/programs); each program defines its own agreement set, and individual users accept them via the user-scoped accept endpoint.

> **Program type:** API Gateway only. Hosted Portal payees accept agreements through the hosted portal UI.

With this resource, you can perform the following requests:

* `GET /programs/{program-token}/agreements` — List the agreements attached to a program (small list; plain GET, not search-consolidated)
* `GET /programs/{program-token}/agreements/{agreement-token}` — Fetch a specific agreement
* `POST /users/{user-token}/agreements/{agreement-token}` — Record a user's acceptance of an agreement

For more information, see [Agreements](page:resources/agreements) and [Onboard Users](page:howtos/onboard-users).

```ruby
agreements_api = client.agreements
```

## Class Name

`AgreementsApi`

## Methods

* [Get-Programs-Prog Token-Agreements](../../doc/controllers/agreements.md#get-programs-prog-token-agreements)
* [Get-Programs-Prog Token-Agreements-Agmt Token](../../doc/controllers/agreements.md#get-programs-prog-token-agreements-agmt-token)
* [Post-Users-User Token-Agreements-Agmt Token](../../doc/controllers/agreements.md#post-users-user-token-agreements-agmt-token)


# Get-Programs-Prog Token-Agreements

Fetch a list of program [agreements](page:resources/agreements) that supports [filtering](page:concepts/filtering-sorting), [sorting](page:concepts/filtering-sorting#sorting), and [pagination](page:concepts/pagination) through existing mechanisms. Program agreements must be accepted by users during [onboarding](page:howtos/onboard-users) before they can be fully activated.

```ruby
def get_programs_prog_token_agreements(program_token,
                                       accept_language: 'en-US',
                                       accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `program_token` | `String` | Template, Required | Auto-generated unique identifier representing a program, prefixed with `prog-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Program Agreements List Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`AgreementListResult`](../../doc/models/agreement-list-result.md).

## Example Usage

```ruby
program_token = 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = agreements_api.get_programs_prog_token_agreements(
  program_token,
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


# Get-Programs-Prog Token-Agreements-Agmt Token

Fetch a single program [agreement](page:resources/agreements) by its `agmt-` [token](page:concepts/working-with-tokens). Returns the agreement title, content, and acceptance requirements.

```ruby
def get_programs_prog_token_agreements_agmt_token(program_token,
                                                  agreement_token,
                                                  accept_language: 'en-US',
                                                  accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `program_token` | `String` | Template, Required | Auto-generated unique identifier representing a program, prefixed with `prog-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `agreement_token` | `String` | Template, Required | Auto-generated unique identifier representing a program agreement, prefixed with `agmt-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^agmt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Program Agreement Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`AgreementResult`](../../doc/models/agreement-result.md).

## Example Usage

```ruby
program_token = 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb'

agreement_token = 'agmt-b33d420f-6c1b-4a93-9455-d6585552b97d'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = agreements_api.get_programs_prog_token_agreements_agmt_token(
  program_token,
  agreement_token,
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


# Post-Users-User Token-Agreements-Agmt Token

Accept a single program [agreement](page:resources/agreements) on behalf of a user. Certain program agreements must be accepted before the user can be fully activated or before specific resources like [prepaid cards](page:resources/prepaid-cards) can be issued. See [Onboard Users](page:howtos/onboard-users) for details on agreement acceptance during onboarding.

```ruby
def post_users_user_token_agreements_agmt_token(user_token,
                                                agreement_token,
                                                accept_language: 'en-US',
                                                accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Template, Required | A token representing the user. This must be a `user-` [token](page:concepts/working-with-tokens). For example user-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^user-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `agreement_token` | `String` | Template, Required | Auto-generated unique identifier representing a program agreement, prefixed with `agmt-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^agmt-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: OK

This method returns an [`ApiResponse`](../../doc/api-response.md) instance.

## Example Usage

```ruby
user_token = 'user-2bbfc967-d12e-4647-a887-d905172fb4bc'

agreement_token = 'agmt-b33d420f-6c1b-4a93-9455-d6585552b97d'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = agreements_api.post_users_user_token_agreements_agmt_token(
  user_token,
  agreement_token,
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

