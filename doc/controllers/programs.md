# Programs

# Programs

---


The *Programs* resource represents the programs configured for your PayQuicker account. A program defines the funding account, operating currency, program type (Hosted Portal or API Gateway), bank, and the agreements that users must accept. Each program is identified by a `prog-` token.

A given customer typically has one program per program-type / currency / region combination.

> **Program type:** Both Hosted Portal and API Gateway can list and fetch their programs.

With this resource, you can perform the following requests:

* `GET /programs` — List your account's programs (small list; plain GET, not search-consolidated)
* `GET /programs/{program-token}` — Fetch a specific program

Program agreements are managed under the [Agreements](page:resources/agreements) tag.

For more information, see [Programs](page:resources/programs) and [Program Types](page:concepts/program-types).

```ruby
programs_api = client.programs
```

## Class Name

`ProgramsApi`

## Methods

* [Get-Programs](../../doc/controllers/programs.md#get-programs)
* [Get-Programs-Prog Token](../../doc/controllers/programs.md#get-programs-prog-token)


# Get-Programs

Fetch a list of [programs](page:resources/programs) that supports [filtering](page:concepts/filtering-sorting), [sorting](page:concepts/filtering-sorting#sorting), and [pagination](page:concepts/pagination) through existing mechanisms. Programs define the configuration and capabilities available to users. See [Program Types](page:concepts/program-types) for details on the different program models.

```ruby
def get_programs(accept_language: 'en-US',
                 accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Program List Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`ProgramListResult`](../../doc/models/program-list-result.md).

## Example Usage

```ruby
accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = programs_api.get_programs(
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


# Get-Programs-Prog Token

Fetch a single [program](page:resources/programs) by its `prog-` [token](page:concepts/working-with-tokens). Returns the program configuration, capabilities, and associated [agreements](page:resources/agreements). See [Program Types](page:concepts/program-types) for details on the different program models.

```ruby
def get_programs_prog_token(program_token,
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

**200**: Sample Program Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`ProgramResult`](../../doc/models/program-result.md).

## Example Usage

```ruby
program_token = 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = programs_api.get_programs_prog_token(
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

