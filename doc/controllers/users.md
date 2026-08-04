# Users

# Users

---


The *Users* resource represents the individuals or businesses who receive payments — employees, contractors, survey participants, distributors, marketplace sellers, or other payees. Each user is identified by a `user-` token generated at creation.

Users can be paid via [Instruments](page:resources/instruments) (bank accounts and electronic wallets) and [Prepaid Cards](page:resources/prepaid-cards), all of which are attached to the user.

> **Program type:** API Gateway only for the API operations on this tag. Hosted Portal programs onboard users via [invitations](page:resources/invitations); Portal payees self-register through the hosted portal and are managed through the hosted portal UI rather than via the Users API directly.

With this resource, you can perform the following requests:

* `POST /users` — Create a user
* `GET /users/{user-token}` — Fetch a user
* `PUT /users/{user-token}` — Update a user
* `POST /users/search` + `GET /users/search/{searchId}` — Search users

Users follow the platform's standard search pattern. There is no plain `GET /users` list — use search instead. See [Searching](page:concepts/searching).

For more information, see [Users](page:resources/users). For a step-by-step guide, see [Onboard Users](page:howtos/onboard-users).

```ruby
users_api = client.users
```

## Class Name

`UsersApi`

## Methods

* [Post-Users](../../doc/controllers/users.md#post-users)
* [Put-Users-User Token](../../doc/controllers/users.md#put-users-user-token)
* [Get-Users-User Token](../../doc/controllers/users.md#get-users-user-token)
* [Search Users](../../doc/controllers/users.md#search-users)
* [Read User Search](../../doc/controllers/users.md#read-user-search)


# Post-Users

Create a new [user](page:resources/users) in your [program](page:resources/programs). Once created, the user can be provisioned with [prepaid cards](page:resources/prepaid-cards), bank-account and electronic-wallet [Instruments](page:resources/instruments), and other resources.

**Available for API Gateway programs only.** Hosted Portal programs onboard users through [invitations](page:resources/invitations) instead.

For a step-by-step guide, see [Onboard Users](page:howtos/onboard-users#path-1-create-a-user-via-api). Check [User Statuses](page:additional-api-information/user-status-types) for possible user states.

```ruby
def post_users(body,
               accept_language: 'en-US',
               accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [_IndividualUser](../../doc/models/individual-user.md) \| [_BusinessUser](../../doc/models/business-user.md) | Body, Required | Polymorphic user request. The userType property identifies the user type and determines required fields and validation rules. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample user response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`UserResult`](../../doc/models/user-result.md).

## Example Usage

```ruby
body = IndividualUser.new(
  program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
  program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
  email: 'edd_glover44@payquicker.testinator.com',
  first_name: 'Edd',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('2000-05-03'),
  country_of_birth: 'US',
  country_of_nationality: 'US',
  addresses: [
    AddressObject.new(
      address_type: 'RESIDENTIAL',
      address_line1: '2083 Crona Walks',
      city: 'Deangelomouth',
      region: 'VA',
      postal_code: '51456',
      country: 'US',
      address_line2: 'Suite 443'
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
  user_type: UserType2::INDIVIDUAL,
  gender: 'NOT_SPECIFIED',
  language: 'en-US',
  tax_resident_status: 'RESIDENT',
  government_id_type: 'SSN',
  government_id: '123-45-6789',
  occupation_title: 'Software Engineer',
  occupation_type: 'TECHNOLOGY',
  primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = users_api.post_users(
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


# Put-Users-User Token

Update a [user](page:resources/users) object (change email, address, personal details, etc.) using a user [token](page:concepts/working-with-tokens). For details on user fields, see [Users](page:resources/users).

```ruby
def put_users_user_token(user_token,
                         body,
                         accept_language: 'en-US',
                         accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Template, Required | A token representing the user. This must be a `user-` [token](page:concepts/working-with-tokens). For example user-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^user-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `body` | [_IndividualUser](../../doc/models/individual-user.md) \| [_BusinessUser](../../doc/models/business-user.md) | Body, Required | Polymorphic user request. The userType property identifies the user type and determines required fields and validation rules. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**201**: Sample user response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`UserResult`](../../doc/models/user-result.md).

## Example Usage

```ruby
user_token = 'user-2bbfc967-d12e-4647-a887-d905172fb4bc'

body = IndividualUser.new(
  program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
  program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
  email: 'edd_glover44@payquicker.testinator.com',
  first_name: 'Edd',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('2000-05-03'),
  country_of_birth: 'US',
  country_of_nationality: 'US',
  addresses: [
    AddressObject.new(
      address_type: 'RESIDENTIAL',
      address_line1: '2083 Crona Walks',
      city: 'Deangelomouth',
      region: 'VA',
      postal_code: '51456',
      country: 'US',
      address_line2: 'Suite 443'
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
  user_type: UserType2::INDIVIDUAL,
  gender: 'NOT_SPECIFIED',
  language: 'en-US',
  tax_resident_status: 'RESIDENT',
  government_id_type: 'SSN',
  government_id: '123-45-6789',
  occupation_title: 'Software Engineer',
  occupation_type: 'TECHNOLOGY',
  primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = users_api.put_users_user_token(
  user_token,
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


# Get-Users-User Token

Fetch a single [user](page:resources/users) record by its `user-` [token](page:concepts/working-with-tokens). Returns the user's personal details, [status](page:additional-api-information/user-status-types), and related [navigation](page:concepts/hateoas) links to associated resources such as [balances](page:resources/balances), [prepaid cards](page:resources/prepaid-cards), and bank-account and electronic-wallet [Instruments](page:resources/instruments).

```ruby
def get_users_user_token(user_token,
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

**200**: Sample user response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`UserResult`](../../doc/models/user-result.md).

## Example Usage

```ruby
user_token = 'user-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = users_api.get_users_user_token(
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


# Search Users

Search for [users](page:resources/users) using structured filter criteria in the request body. The response carries page 1 of the result set and a `searchId`; use `GET /users/search/{searchId}?page=N&pageSize=N` to read additional pages from the cached result. See [Searching](page:concepts/searching) for the two-step pattern, [Filtering & Sorting](page:concepts/filtering-sorting) for valid operators and sort directions, and the [Scope Discriminator](page:concepts/scope-discriminator) for the addressing scheme.

```ruby
def search_users(body,
                 accept_language: 'en-US',
                 accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`UserSearchRequest`](../../doc/models/user-search-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample user list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`UserListResult`](../../doc/models/user-list-result.md).

## Example Usage

```ruby
body = UserSearchRequest.new(
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = users_api.search_users(
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


# Read User Search

Retrieve a specific page of results from a previous user search request. Pagination via `page` and `pageSize` query parameters (defaults: `page=1`, `pageSize=10`). Cached search results are held for **30 minutes** from creation; an expired `searchId` returns `404 Not Found`. See [Pagination](page:concepts/pagination).

```ruby
def read_user_search(search_id,
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

**200**: Sample user list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`UserListResult`](../../doc/models/user-list-result.md).

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = users_api.read_user_search(
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

