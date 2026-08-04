# Transfers

# Transfers

---


The *Transfers* resource is the unified endpoint for all money movement on the platform. A single `POST /transfers` call covers payments, spendbacks, payment retractions, spendback refunds, and bank/card/user-to-user transfers — the operation type is selected by a `transferType` discriminator on the request body.

`transferType` values:

* `PAYMENT` — payer-to-payee disbursement. Body: Payment Quote.
* `SPENDBACK` — payee uses their account balance to purchase from the payer. Body: Spendback Quote.
* `RETRACTION` — payer retracts a previously issued payment quote. Body: Payment Retraction Quote.
* `REFUND` — payer refunds a previously accepted spendback. Body: Spendback Refund Quote.
* `TRANSFER` — bank, card, or user-to-user wallet movement. Gateway only. Body: Transfer Quote.

Every transfer follows a quote / accept lifecycle. `POST /transfers` returns a quote in `PENDING_ACCEPTANCE`. The customer accepts the quote with `POST /transfers/{transfer-token}/accept` to execute it, or cancels with `DELETE /transfers/{transfer-token}` before acceptance.

Token prefixes by `transferType`: `pmnt` (PAYMENT), `spnd` (SPENDBACK), `retx` (RETRACTION), `xfer` (TRANSFER), `rfnd` (REFUND).

With this resource, you can perform the following requests:

* `POST /transfers`: Create a quote for any supported `transferType`
* `GET /transfers/{transfer-token}`: Fetch a transfer by token
* `DELETE /transfers/{transfer-token}`: Cancel a quote that has not yet been accepted
* `POST /transfers/{transfer-token}/accept`: Accept a quote and execute the transfer
* `POST /transfers/search`: Search transfers (filter by `transferType`, user, source, destination, status, etc.)

Hosted Portal programs may call `POST /transfers` and `POST /transfers/search` for `transferType` values `PAYMENT`, `SPENDBACK`, `RETRACTION`, and `REFUND`. `transferType: TRANSFER` is Gateway only. See [Program Types](page:concepts/program-types).

For more information, see [Transfers](page:resources/transfers). For step-by-step guides, see [Make and Manage Payments](page:howtos/make-and-manage-payments), [Process Spendbacks and Refunds](page:howtos/process-spendbacks-and-refunds), and [Make a Bank Transfer](page:howtos/make-a-bank-transfer).

```ruby
transfers_api = client.transfers
```

## Class Name

`TransfersApi`

## Methods

* [Post-Transfers](../../doc/controllers/transfers.md#post-transfers)
* [Get-Transfer](../../doc/controllers/transfers.md#get-transfer)
* [Delete-Transfer](../../doc/controllers/transfers.md#delete-transfer)
* [Post-Transfer-Accept](../../doc/controllers/transfers.md#post-transfer-accept)
* [Search Transfers](../../doc/controllers/transfers.md#search-transfers)
* [Read Transfer Search](../../doc/controllers/transfers.md#read-transfer-search)


# Post-Transfers

Create a quote for any supported transfer type in a single unified endpoint. The request body must include a `transferType` property that identifies the type of quote being created: `PAYMENT`, `SPENDBACK`, `RETRACTION`, `TRANSFER`, or `REFUND`.

The discriminator on `transferType` determines which request schema is applied and which response type is returned, enabling full polymorphic request and response handling.

- **payment**: Equivalent to `POST /payments` — uses the Payment Quote request shape
- **spendback**: Equivalent to `POST /spend-back` — uses the Spendback Quote request shape
- **retraction**: Equivalent to `POST /payments/{payment-token}/retractions` — uses the Payment Retraction Quote request shape
- **transfer**: Equivalent to `POST /transfers` — uses the Transfer Quote request shape
- **refund**: Equivalent to `POST /spend-back/{spendback-token}/refunds` — uses the Spendback Refund Quote request shape

```ruby
def post_transfers(body,
                   accept_language: 'en-US',
                   accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [PortalPaymentQuote](../../doc/models/portal-payment-quote.md) \| [GatewayPaymentQuote](../../doc/models/gateway-payment-quote.md) \| [GatewaySpendbackQuote](../../doc/models/gateway-spendback-quote.md) \| [PortalSpendbackQuote](../../doc/models/portal-spendback-quote.md) \| [PaymentRetractionQuote](../../doc/models/payment-retraction-quote.md) \| [GatewayTransferQuote](../../doc/models/gateway-transfer-quote.md) \| [PortalTransferQuote](../../doc/models/portal-transfer-quote.md) \| [_SpendbackRefundQuote](../../doc/models/spendback-refund-quote.md) | Body, Required | Polymorphic quote request using oneOf. The transferType property in the request body identifies the transfer type being created and determines which service layer method handles the request. The oneOf members each carry a transferType with a fixed single-value enum for SDK type inference. No discriminator is applied on the request — discriminated typing is only used on response objects. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Polymorphic transfer response. Returns the appropriate typed result object based on the transferType discriminator property in the response body. Resolves to PaymentResult, SpendbackResult, PaymentRetractionResult, TransferResult, or SpendbackRefundResult.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PaymentResult | SpendbackResult | PaymentRetractionResult | TransferResult | SpendbackRefundResult`.

## Example Usage

```ruby
body = PortalPaymentQuote.new(
  source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  program_user_id: 'PQAPI-a6f83b0f903fc540ee1cb41ed137983c',
  email: 'alberta7@payquicker.testinator.com',
  amount: '2.00',
  client_payment_ref: '2d8a3d44a9194d3ea87a2c99154e8523',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType::PAYMENT,
  memo: 'Q2 incentive',
  purpose: 'BONUS'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = transfers_api.post_transfers(
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


# Get-Transfer

Fetch the details of a quote by its token. The response shape is determined by the `transferType` discriminator in the response body — a payment quote returns a Payment Result, a spendback returns a Spendback Result, etc.

The `transfer-id` path parameter must be a valid transfer token in the format `{prefix}-{uuid}` where prefix is one of `pmnt`, `spnd`, `retx`, `xfer`, or `rfnd`.

```ruby
def get_transfer(transfer_token,
                 accept_language: 'en-US',
                 accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `transfer_token` | `String` | Template, Required | The token of the quote to operate on. Must be a valid token for one of the supported quote types: `pmnt-` (payment), `spnd-` (spendback), `retx-` (retraction), `xfer-` (transfer), or `rfnd-` (refund). Tokens use the format `{prefix}-{uuid}`, for example `pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(pmnt\|spnd\|retx\|xfer\|rfnd)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Polymorphic transfer response. Returns the appropriate typed result object based on the transferType discriminator property in the response body. Resolves to PaymentResult, SpendbackResult, PaymentRetractionResult, TransferResult, or SpendbackRefundResult.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PaymentResult | SpendbackResult | PaymentRetractionResult | TransferResult | SpendbackRefundResult`.

## Example Usage

```ruby
transfer_token = 'pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = transfers_api.get_transfer(
  transfer_token,
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


# Delete-Transfer

Cancel an open transfer quote before it has been accepted. Once cancelled, the quote status transitions to `CANCELLED` and any reserved funds are released.

The `transfer-id` path parameter must be a valid transfer token in the format `{prefix}-{uuid}` where prefix is one of `pmnt`, `spnd`, `retx`, `xfer`, or `rfnd`. The response shape is determined by the `transferType` discriminator in the response body.

```ruby
def delete_transfer(transfer_token,
                    accept_language: 'en-US',
                    accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `transfer_token` | `String` | Template, Required | The token of the quote to operate on. Must be a valid token for one of the supported quote types: `pmnt-` (payment), `spnd-` (spendback), `retx-` (retraction), `xfer-` (transfer), or `rfnd-` (refund). Tokens use the format `{prefix}-{uuid}`, for example `pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(pmnt\|spnd\|retx\|xfer\|rfnd)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Polymorphic transfer response. Returns the appropriate typed result object based on the transferType discriminator property in the response body. Resolves to PaymentResult, SpendbackResult, PaymentRetractionResult, TransferResult, or SpendbackRefundResult.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PaymentResult | SpendbackResult | PaymentRetractionResult | TransferResult | SpendbackRefundResult`.

## Example Usage

```ruby
transfer_token = 'pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = transfers_api.delete_transfer(
  transfer_token,
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


# Post-Transfer-Accept

Accept an open quote to execute the transfer. Once accepted, the quote status transitions from `PENDING_ACCEPTANCE` to `ACCEPTED` and the corresponding transfer is executed.

The `transfer-id` path parameter must be a valid transfer token in the format `{prefix}-{uuid}` where prefix is one of `pmnt`, `spnd`, `retx`, `xfer`, or `rfnd`. The response shape is determined by the `transferType` discriminator in the response body.

```ruby
def post_transfer_accept(transfer_token,
                         accept_language: 'en-US',
                         accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `transfer_token` | `String` | Template, Required | The token of the quote to operate on. Must be a valid token for one of the supported quote types: `pmnt-` (payment), `spnd-` (spendback), `retx-` (retraction), `xfer-` (transfer), or `rfnd-` (refund). Tokens use the format `{prefix}-{uuid}`, for example `pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(pmnt\|spnd\|retx\|xfer\|rfnd)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Polymorphic transfer response. Returns the appropriate typed result object based on the transferType discriminator property in the response body. Resolves to PaymentResult, SpendbackResult, PaymentRetractionResult, TransferResult, or SpendbackRefundResult.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PaymentResult | SpendbackResult | PaymentRetractionResult | TransferResult | SpendbackRefundResult`.

## Example Usage

```ruby
transfer_token = 'pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = transfers_api.post_transfer_accept(
  transfer_token,
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


# Search Transfers

Initiate a search for quotes of a specific type. The request body must include a `transferType` property to identify the quote type being searched. The `filters` and `sort` criteria in the body correspond to the selected quote type.

Cross-type searches are not supported — each request must target a single quote type. Once the search is created, use the returned `searchId` with `GET /transfers/search/{searchId}` to retrieve paginated results.

Supported types and their filter schemas:

- **payment** — uses `PaymentSearch`
- **spendback** — uses `SpendbackSearch`
- **retraction** — uses `PaymentRetractionSearch`
- **transfer** — uses `TransferSearch`
- **refund** — uses `SpendbackRefundSearch`

See [Searching](page:concepts/searching) for the two-step search pattern, [Filtering & Sorting](page:concepts/filtering-sorting) for comparison operators and sort directions, and the [Scope Discriminator](page:concepts/scope-discriminator) for the addressing scheme used in the body.

```ruby
def search_transfers(body,
                     accept_language: 'en-US',
                     accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [PaymentSearch](../../doc/models/payment-search.md) \| [SpendbackSearch](../../doc/models/spendback-search.md) \| [PaymentRetractionSearch](../../doc/models/payment-retraction-search.md) \| [TransferSearch](../../doc/models/transfer-search.md) \| [SpendbackRefundSearch](../../doc/models/spendback-refund-search.md) | Body, Required | Polymorphic quote search request using oneOf. The transferType property determines which typed search criteria schema is applied. Cross-type searches are not supported — each request must target a single quote type. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Polymorphic transfer search results. Returns a typed paginated list based on the transferType discriminator in the response body.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PaymentListResult | SpendbackListResult | PaymentRetractionListResult | TransferListResult | SpendbackRefundListResult`.

## Example Usage

```ruby
body = PaymentSearch.new(
  transfer_type: TransferType::PAYMENT,
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = transfers_api.search_transfers(
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


# Read Transfer Search

Retrieve a specific page of results from a previously initiated quote search. Use the `searchId` returned by `POST /transfers/search` to paginate through results.

The response shape is determined by the `transferType` discriminator in the response body. Each item in the `payload` array will be typed according to the quote type of the originating search request.

Pagination is controlled by `page` and `pageSize` query parameters (defaults: `page=1`, `pageSize=10`). Cached search results are held for **30 minutes** from creation; an expired `searchId` returns `404 Not Found`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching).

```ruby
def read_transfer_search(search_id,
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

**200**: Polymorphic transfer search results. Returns a typed paginated list based on the transferType discriminator in the response body.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PaymentListResult | SpendbackListResult | PaymentRetractionListResult | TransferListResult | SpendbackRefundListResult`.

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = transfers_api.read_transfer_search(
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

