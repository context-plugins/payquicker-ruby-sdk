# Receipts

# Receipts

---


The *Receipts* resource is the record of every settled transaction on the platform — payments, spendbacks, transfers, prepaid card activity (purchases, ATM withdrawals), retractions, refunds, and fees. Receipts are created automatically when a transaction settles; you do not create them yourself. Each receipt is identified by an `rcpt-` token.

Receipts cover three transaction surfaces:

* **User receipts** — non-prepaid-card transactions involving a user's wallet: payments, account-to-account transfers, prepaid-card loads, prepaid-card unloads, spendbacks, bank transfers, electronic-wallet transfers, and fees.
* **Prepaid card receipts** — real-world card transactions: card-network purchases, ATM activity, prepaid-card loads/unloads, bank or electronic-wallet transfers from the card, and card-related fees.
* **Company account receipts** — transactions affecting the funding account: outgoing payments, account-to-account transfers, fees, spendbacks, spendback returns.

> **Program type:** API Gateway can search and fetch all receipt types. Hosted Portal can search and fetch **company-account receipts only** — Portal programs do not have direct access to receipts for individual users.

With this resource, you can perform the following requests:

* `GET /receipts/{receipt-token}` — Fetch a receipt by token
* `POST /receipts/search` + `GET /receipts/search/{searchId}` — Search receipts

For more information, see [Receipts](page:resources/receipts) and [Receipt Details](page:additional-api-information/receipt-details).

```ruby
receipts_api = client.receipts
```

## Class Name

`ReceiptsApi`

## Methods

* [Get Receipt](../../doc/controllers/receipts.md#get-receipt)
* [Search Receipts](../../doc/controllers/receipts.md#search-receipts)
* [Read Receipt Search](../../doc/controllers/receipts.md#read-receipt-search)


# Get Receipt

Fetch a single [receipt](page:resources/receipts) by its token.

```ruby
def get_receipt(receipt_token,
                accept_language: 'en-US',
                accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `receipt_token` | `String` | Template, Required | One of either a `rcpt-` [token](page:concepts/working-with-tokens), portalId, or client[Payment\|Spendback\|SpendbackRefund]Id for the receipt. For example rcpt-2bbfc967-d12e-4647-a887-d905172fb4bc, ARCL1B6ELQN4MIUCH, OR unique transaction ID.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Account Receipt Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`ReceiptResult`](../../doc/models/receipt-result.md).

## Example Usage

```ruby
receipt_token = 'rcpt-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = receipts_api.get_receipt(
  receipt_token,
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


# Search Receipts

Search for [receipts](page:resources/receipts) across scopes using a structured filter body. Include a `scope` property to identify the target (user, account, or prepaid-card token). The response carries page 1 of the results (or the page you requested via `page` / `pageSize`) and a `searchId` in the meta; use `GET /receipts/search/{searchId}` to read additional pages from the cached result set. See [Searching](page:concepts/searching), [Filtering & Sorting](page:concepts/filtering-sorting), and the [Scope Discriminator](page:concepts/scope-discriminator).

> **Hosted Portal programs** can search company-account receipts only — see [Program Types](page:concepts/program-types).

```ruby
def search_receipts(body,
                    accept_language: 'en-US',
                    accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`ReceiptSearchRequest`](../../doc/models/receipt-search-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample Account Receipt List Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`ReceiptSearchResult`](../../doc/models/receipt-search-result.md).

## Example Usage

```ruby
body = ReceiptSearchRequest.new(
  scope: 'dest-925b8e69-7380-4827-b127-fda0801b090a',
  scope_type: 'TOKEN',
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = receipts_api.search_receipts(
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


# Read Receipt Search

Retrieve a page from a previous receipt search.

```ruby
def read_receipt_search(search_id,
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

**200**: Sample Account Receipt List Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`ReceiptSearchResult`](../../doc/models/receipt-search-result.md).

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = receipts_api.read_receipt_search(
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

