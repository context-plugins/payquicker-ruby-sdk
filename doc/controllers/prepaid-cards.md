# Prepaid Cards

```ruby
prepaid_cards_api = client.prepaid_cards
```

## Class Name

`PrepaidCardsApi`

## Methods

* [Order Prepaid Card](../../doc/controllers/prepaid-cards.md#order-prepaid-card)
* [Get Prepaid Card](../../doc/controllers/prepaid-cards.md#get-prepaid-card)
* [Update Prepaid Card](../../doc/controllers/prepaid-cards.md#update-prepaid-card)
* [Replace Prepaid Card](../../doc/controllers/prepaid-cards.md#replace-prepaid-card)
* [Search Prepaid Cards](../../doc/controllers/prepaid-cards.md#search-prepaid-cards)
* [Read Prepaid Card Search](../../doc/controllers/prepaid-cards.md#read-prepaid-card-search)


# Order Prepaid Card

Order a [prepaid card](page:resources/prepaid-cards). Include `scope` as a query parameter to identify the target user or account.

```ruby
def order_prepaid_card(body,
                       accept_language: 'en-US',
                       accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`OrderCardRequest`](../../doc/models/order-card-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**201**: Sample Prepaid Card Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardResult`](../../doc/models/card-result.md).

## Example Usage

```ruby
body = OrderCardRequest.new(
  user_token: 'user-4ae4f530-d6f4-4e70-aee5-d0d57719f9d6',
  card_package: '71290',
  program_token: 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb',
  card_reference_number: 'string'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = prepaid_cards_api.order_prepaid_card(
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


# Get Prepaid Card

Fetch a single prepaid card by its destination token.

```ruby
def get_prepaid_card(destination_token,
                     accept_language: 'en-US',
                     accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Prepaid Card Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardResult`](../../doc/models/card-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = prepaid_cards_api.get_prepaid_card(
  destination_token,
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


# Update Prepaid Card

Partially update a [prepaid card](page:resources/prepaid-cards), such as changing its status or card group. See [Card Statuses](page:additional-api-information/card-status-types) for allowed status transitions.

```ruby
def update_prepaid_card(destination_token,
                        body,
                        accept_language: 'en-US',
                        accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `body` | [`UpdateCardRequest`](../../doc/models/update-card-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**201**: Sample Prepaid Card Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardResult`](../../doc/models/card-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

body = UpdateCardRequest.new(
  user_token: 'user-4ae4f530-d6f4-4e70-aee5-d0d57719f9d6',
  card_package: '71290',
  status: 'ACTIVATED'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = prepaid_cards_api.update_prepaid_card(
  destination_token,
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


# Replace Prepaid Card

Replace a [prepaid card](page:resources/prepaid-cards) that has been lost, stolen, or damaged. The replacement card is linked to the same user and destination. See [Card Replacement Reasons](page:additional-api-information/card-replacement-reason-types) for the list of valid replacement reasons and [Manage Prepaid Cards](page:howtos/manage-prepaid-cards) for a step-by-step guide.

```ruby
def replace_prepaid_card(destination_token,
                         body,
                         accept_language: 'en-US',
                         accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `body` | [`ReplaceCardRequest`](../../doc/models/replace-card-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample Prepaid Card Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardResult`](../../doc/models/card-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

body = ReplaceCardRequest.new(
  user_token: 'user-4ae4f530-d6f4-4e70-aee5-d0d57719f9d6',
  card_package: '71290',
  card_replacement_reason: 'COMPROMISED'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = prepaid_cards_api.replace_prepaid_card(
  destination_token,
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


# Search Prepaid Cards

Search for [prepaid cards](page:resources/prepaid-cards) using a structured filter body. Include a `scope` property to address the target user. The response carries the requested page and a `searchId`; use `GET /prepaid-cards/search/{searchId}` to paginate the cached result set. See [Searching](page:concepts/searching).

```ruby
def search_prepaid_cards(body,
                         accept_language: 'en-US',
                         accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`PrepaidCardSearchRequest`](../../doc/models/prepaid-card-search-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Prepaid Card List Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardSearchResult`](../../doc/models/card-search-result.md).

## Example Usage

```ruby
body = PrepaidCardSearchRequest.new(
  scope: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  scope_type: 'TOKEN',
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = prepaid_cards_api.search_prepaid_cards(
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


# Read Prepaid Card Search

Retrieve a page from a previous prepaid card search.

```ruby
def read_prepaid_card_search(search_id,
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

**200**: Sample Prepaid Card List Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardSearchResult`](../../doc/models/card-search-result.md).

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = prepaid_cards_api.read_prepaid_card_search(
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

