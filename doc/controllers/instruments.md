# Instruments

# Instruments

---


The *Instruments* resource is the unified payout-destination resource for bank accounts and electronic wallets. A user attaches one or more instruments to receive funds via the appropriate rail:

* **Bank account instruments** enable rails like ACH, Same-Day ACH, SEPA, and other domestic and international transfers.
* **Electronic wallet instruments** enable third-party wallets such as Alipay, Orange Money, and similar regional payout networks.

Prepaid cards are managed separately under [Prepaid Cards](page:resources/prepaid-cards) — they are not Instruments.

With this resource, you can perform the following requests:

* `POST`: Create a new instrument
* `GET`: Fetch an instrument by token
* `PUT`: Update an instrument
* `DELETE`: Delete an instrument
* `POST /search`: Search instruments
* `POST /requirements/search`: Discover the fields required for a given country / currency / instrument-type combination

> **Webhook namespace note.** Instrument lifecycle events are published under the per-type namespaces — `BANKACCOUNTS.*` for bank accounts and `ELECTRONICWALLETS.*` for electronic wallets. There is no `INSTRUMENTS.*` namespace. See [Available Webhooks](page:concepts/available-webhooks).

For more information, see [Instruments](page:resources/instruments). For a step-by-step guide, see [Set Up Instruments](page:howtos/set-up-instruments).

```ruby
instruments_api = client.instruments
```

## Class Name

`InstrumentsApi`

## Methods

* [Create Instrument](../../doc/controllers/instruments.md#create-instrument)
* [Get Instrument](../../doc/controllers/instruments.md#get-instrument)
* [Update Instrument](../../doc/controllers/instruments.md#update-instrument)
* [Delete Instrument](../../doc/controllers/instruments.md#delete-instrument)
* [Search Instruments](../../doc/controllers/instruments.md#search-instruments)
* [Read Instrument Search](../../doc/controllers/instruments.md#read-instrument-search)
* [Search Instrument Requirements](../../doc/controllers/instruments.md#search-instrument-requirements)
* [Read Instrument Requirement Search](../../doc/controllers/instruments.md#read-instrument-requirement-search)


# Create Instrument

Create a financial instrument. The `instrumentType` property identifies whether this is a bank account (`BANK`) or electronic wallet (`EWALLET`). Include exactly one of `userToken` or `accountToken` to identify the target user or account. The response shape is determined by the `instrumentType` — a BANK instrument returns a bank account result, while an EWALLET instrument returns an electronic wallet result.

```ruby
def create_instrument(body,
                      accept_language: 'en-US',
                      accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [UserBankAccount](../../doc/models/user-bank-account.md) \| [CompanyBankAccount](../../doc/models/company-bank-account.md) \| [UserEwallet](../../doc/models/user-ewallet.md) \| [CompanyEwallet](../../doc/models/company-ewallet.md) | Body, Required | Polymorphic instrument create/update request using oneOf. The instrumentType property determines which typed request schema is applied. Each request must target a single instrument type (BANK or EWALLET) and include exactly one of userToken or accountToken to identify the target user or account. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Polymorphic instrument result. Returns either a bank account or electronic wallet result depending on the instrumentType.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountResult | EwalletResult`.

## Example Usage

```ruby
body = UserBankAccount.new(
  instrument_type: InstrumentType::BANK,
  user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  purpose: 'PERSONAL',
  country: 'US',
  currency: 'USD',
  description: 'Primary personal checking account',
  fields: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '222371863'
    ),
    BankAccountField.new(
      key: 'BANK_BBAN',
      value: '1102224234'
    ),
    BankAccountField.new(
      key: 'BANK_NAME',
      value: 'Central City Bank'
    ),
    BankAccountField.new(
      key: 'BENEFICIARY_NAME',
      value: 'Maybelle Volkman'
    )
  ],
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.create_instrument(
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


# Get Instrument

Fetch a single instrument by destination token. Pass `instrumentType` as a query parameter to identify the instrument type. The response shape is determined by the `instrumentType` — a BANK instrument returns a bank account result, while an EWALLET instrument returns an electronic wallet result.

```ruby
def get_instrument(destination_token,
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

**200**: Polymorphic instrument result. Returns either a bank account or electronic wallet result depending on the instrumentType.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountResult | EwalletResult`.

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.get_instrument(
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


# Update Instrument

Update an existing instrument by its destination token. Include `instrumentType` in the request body along with `userToken` or `accountToken`. Ownership is verified from the destination token. The response shape is determined by the `instrumentType`.

```ruby
def update_instrument(destination_token,
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
| `body` | [UserBankAccount](../../doc/models/user-bank-account.md) \| [CompanyBankAccount](../../doc/models/company-bank-account.md) \| [UserEwallet](../../doc/models/user-ewallet.md) \| [CompanyEwallet](../../doc/models/company-ewallet.md) | Body, Required | Polymorphic instrument create/update request using oneOf. The instrumentType property determines which typed request schema is applied. Each request must target a single instrument type (BANK or EWALLET) and include exactly one of userToken or accountToken to identify the target user or account. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Polymorphic instrument result. Returns either a bank account or electronic wallet result depending on the instrumentType.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountResult | EwalletResult`.

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

body = UserBankAccount.new(
  instrument_type: InstrumentType::BANK,
  user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  purpose: 'PERSONAL',
  country: 'US',
  currency: 'USD',
  description: 'Primary personal checking account',
  fields: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '222371863'
    ),
    BankAccountField.new(
      key: 'BANK_BBAN',
      value: '1102224234'
    ),
    BankAccountField.new(
      key: 'BANK_NAME',
      value: 'Central City Bank'
    ),
    BankAccountField.new(
      key: 'BENEFICIARY_NAME',
      value: 'Maybelle Volkman'
    )
  ],
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH'
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.update_instrument(
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


# Delete Instrument

Delete an instrument by destination token. Include `scope` and `instrumentType` in the request body.

```ruby
def delete_instrument(destination_token,
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

`modify`

## Response Type

**200**: Polymorphic instrument result. Returns either a bank account or electronic wallet result depending on the instrumentType.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountResult | EwalletResult`.

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.delete_instrument(
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


# Search Instruments

Search for [instruments](page:resources/instruments) — bank accounts or electronic wallets — of a specific type. The request body must include an `instrumentType` discriminator and a `scope` property addressing the target user. The `filters` and `sort` criteria correspond to the selected instrument type.

Supported types and their filter schemas:

- **BANK** — uses `BankAccountSearchRequest`
  with bank-account filter fields

- **EWALLET** — uses `EwalletSearchRequest`
  with electronic-wallet filter fields

The response carries the requested page and a `searchId`; use `GET /instruments/search/{searchId}` to paginate the cached result set. See [Searching](page:concepts/searching).

```ruby
def search_instruments(body,
                       accept_language: 'en-US',
                       accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [BankAccountSearchRequest](../../doc/models/bank-account-search-request.md) \| [EwalletSearchRequest](../../doc/models/ewallet-search-request.md) | Body, Required | Polymorphic instrument search request using oneOf. The instrumentType property determines which typed search criteria schema is applied. Each request must target a single instrument type (BANK or EWALLET). |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Polymorphic instrument list result. Returns either bank account or electronic wallet list results depending on the instrumentType of the originating search.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountListResult | EwalletListResult`.

## Example Usage

```ruby
body = BankAccountSearchRequest.new(
  instrument_type: InstrumentType10::BANK,
  scope: 'user-c7dfa7cf-ea90-40d7-80a0-5219d54eb9ce',
  scope_type: 'TOKEN',
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.search_instruments(
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


# Read Instrument Search

Retrieve a specific page of results from a previously initiated instrument search. Use the `searchId` returned by `POST /instruments/search` to paginate through results. The response shape is determined by the `instrumentType` of the originating search.

```ruby
def read_instrument_search(search_id,
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

**200**: Polymorphic instrument list result. Returns either bank account or electronic wallet list results depending on the instrumentType of the originating search.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountListResult | EwalletListResult`.

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.read_instrument_search(
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


# Search Instrument Requirements

Initiate a search for instrument requirements of a specific type. The request body must include `instrumentType` (`BANK` or `EWALLET`) and `scope` (user, account, or destination token). The `filters` correspond to the selected instrument type. Requirement search does not support sorting.

Supported types and their filter schemas:

- **BANK** — uses `BankAccountRequirementSearchRequest`
  with bank account requirement filter fields

- **EWALLET** — uses `EwalletRequirementSearchRequest`
  with electronic wallet requirement filter fields

```ruby
def search_instrument_requirements(body,
                                   accept_language: 'en-US',
                                   accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [BankAccountRequirementSearchRequest](../../doc/models/bank-account-requirement-search-request.md) \| [EwalletRequirementSearchRequest](../../doc/models/ewallet-requirement-search-request.md) | Body, Required | Polymorphic instrument requirement search request using oneOf. The instrumentType property determines which typed search criteria schema is applied. Each request must target a single instrument type. |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Polymorphic instrument requirement list result. Returns either bank account or electronic wallet requirement list results depending on the instrumentType.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountRequirementListResult | EwalletRequirementListResult`.

## Example Usage

```ruby
body = BankAccountRequirementSearchRequest.new(
  instrument_type: InstrumentType12::BANK,
  scope: 'acct-5a9aeefd-b103-4a41-bc6d-fea6a6a709a8',
  scope_type: 'TOKEN',
  filters: [
    BankAccountRequirementSearchFilterItem.new(
      field: 'CURRENCY',
      comparison: 'EQUAL_TO',
      value: 'USD'
    ),
    BankAccountRequirementSearchFilterItem.new(
      field: 'COUNTRY',
      comparison: 'EQUAL_TO',
      value: 'US'
    )
  ],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.search_instrument_requirements(
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


# Read Instrument Requirement Search

Retrieve a specific page of results from a previously initiated instrument requirement search. Use the `searchId` returned by `POST /instruments/requirements/search` to paginate through results. The response shape is determined by the `instrumentType` of the originating search.

```ruby
def read_instrument_requirement_search(search_id,
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

**200**: Polymorphic instrument requirement list result. Returns either bank account or electronic wallet requirement list results depending on the instrumentType.

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `BankAccountRequirementListResult | EwalletRequirementListResult`.

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = instruments_api.read_instrument_requirement_search(
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

