# Compliance

# Compliance

---


The *Compliance* tag groups operations that expose the platform's compliance check results — currently identity-verification (IDV) checks. IDV runs automatically during user onboarding and on subsequent compliance triggers, verifying identity against external data sources.

> **Program type:** API Gateway only. Hosted Portal payees see their IDV outcomes through the hosted portal UI.

With this resource, you can perform the following requests:

* `GET /users/{user-token}/idv-checks` — List Identity Checks for a user (small bounded list; plain GET, not search-consolidated)
* `GET /users/{user-token}/idv-checks/{idvc-token}` — Fetch a specific IDV check

For more information, see [IDV Checks](page:resources/idv-checks) and [KYC Enums](page:additional-api-information/kyc-enums).

```ruby
compliance_api = client.compliance
```

## Class Name

`ComplianceApi`

## Methods

* [Get-Users-User Token-Idv-Checks](../../doc/controllers/compliance.md#get-users-user-token-idv-checks)
* [Get-Users-User Token-Idv-Checks-Idvc Token](../../doc/controllers/compliance.md#get-users-user-token-idv-checks-idvc-token)


# Get-Users-User Token-Idv-Checks

Fetch a list of [IDV checks](page:resources/idv-checks) for a user that supports [filtering](page:concepts/filtering-sorting), [sorting](page:concepts/filtering-sorting#sorting), and [pagination](page:concepts/pagination) through existing mechanisms. Identity verification (IDV) is performed automatically during onboarding to verify the user's identity against external data sources. See also [KYC Enums](page:additional-api-information/kyc-enums).

```ruby
def get_users_user_token_idv_checks(user_token,
                                    accept_language: 'en-US',
                                    accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Template, Required | A token representing the user. This must be a `user-` [token](page:concepts/working-with-tokens). For example user-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^user-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Example response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`IdvCheckListResult`](../../doc/models/idv-check-list-result.md).

## Example Usage

```ruby
user_token = 'user-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = compliance_api.get_users_user_token_idv_checks(
  user_token,
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


# Get-Users-User Token-Idv-Checks-Idvc Token

Fetch a single [IDV check](page:resources/idv-checks) result by its `idvc-` token. Returns the verification type, result, disposition, and provider details.

```ruby
def get_users_user_token_idv_checks_idvc_token(user_token,
                                               idvc_token,
                                               accept_language: 'en-US',
                                               accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Template, Required | A token representing the user. This must be a `user-` [token](page:concepts/working-with-tokens). For example user-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^user-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `idvc_token` | `String` | Template, Required | Auto-generated unique identifier representing a user IDV check, prefixed with `idvc-`. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Example response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`IdvCheckResult`](../../doc/models/idv-check-result.md).

## Example Usage

```ruby
user_token = 'user-2bbfc967-d12e-4647-a887-d905172fb4bc'

idvc_token = 'idvc-6e7567e0-c2db-485d-896d-45901a10aaaa'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = compliance_api.get_users_user_token_idv_checks_idvc_token(
  user_token,
  idvc_token,
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

