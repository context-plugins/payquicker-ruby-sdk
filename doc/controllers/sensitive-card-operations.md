# Sensitive Card Operations

```ruby
sensitive_card_operations_api = client.sensitive_card_operations
```

## Class Name

`SensitiveCardOperationsApi`

## Methods

* [Create Card Data Token](../../doc/controllers/sensitive-card-operations.md#create-card-data-token)
* [Show Card](../../doc/controllers/sensitive-card-operations.md#show-card)
* [Create Card Pin Token](../../doc/controllers/sensitive-card-operations.md#create-card-pin-token)
* [Get Card Pin](../../doc/controllers/sensitive-card-operations.md#get-card-pin)
* [Set Card Pin](../../doc/controllers/sensitive-card-operations.md#set-card-pin)


# Create Card Data Token

Generate a one-time token used to reveal [prepaid card](page:resources/prepaid-cards) PCI data (card number, CVV, expiry) in the form of image data (base64) or JSON. This is the first step of a two-step client-side flow — the returned token is then passed to [Fetch Card Data]($e/Client%20Side/Fetch%20Card%20Data) using client-side authentication. For a step-by-step guide, see [Display a Virtual Card](page:howtos/display-a-virtual-card).

```ruby
def create_card_data_token(destination_token,
                           format)
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `format` | `String` | Query, Required | Desired format for the prepaid card data. |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample Generate Prepaid Card Data Token Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`ShowCardTokenResult`](../../doc/models/show-card-token-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

format = 'TEXT'

result = sensitive_card_operations_api.create_card_data_token(
  destination_token,
  format
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


# Show Card

Return [prepaid card](page:resources/prepaid-cards) PCI data (card number, CVV, expiry) in the form of image data, text, or both. This is the second step of a two-step client-side flow — call [Create Card Data Token]($e/Client%20Side/Create%20Card%20Data%20Token) first to obtain the required token, then use client-side authentication to call this endpoint. For a step-by-step guide, see [Display a Virtual Card](page:howtos/display-a-virtual-card).

```ruby
def show_card(destination_token,
              body)
```

## Authentication

This endpoint requires [clientside](../../doc/auth/oauth-2-bearer-token.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `body` | [_ShowCardText](../../doc/models/show-card-text.md) \| [_ShowCardImage](../../doc/models/show-card-image.md) | Body, Required | Polymorphic request for retrieving prepaid card data. Discriminated by the `format` property. Use `TEXT` to retrieve card number, CVV, expiry, and cardholder name. Use `IMAGE` to retrieve a card image (front or back). |

## Response Type

**200**: Sample Prepaid Card Data Token Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type `PrepaidCardDataTextResult | PrepaidCardDataImageResult`.

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

body = ShowCardText.new(
  operation_token: 'iEureKuLW1gZQ7d3/2ijX4+6bDZuUwpp2QmhPfedarncS2Cde1Ebmby+dxfeP7+Iaty9YYCLFwY42HHOm03dliH7Jp0Yo/sjOb/FmSQ3IOVYpNSYBcZYGmgpyBEG9gPa2HRIKK8+NcPVjjb+0gfqFAI52Emk0P+VPaBZ2NgsENV/I4MuIkWsUXha3QZh49a0EK3wO14jwR4BosY/rk0/9F5uJEWUjv8gvPej+dCFyMnybjj6jPK9f/gFlPUYVHuS',
  format: Format2::TEXT
)

result = sensitive_card_operations_api.show_card(
  destination_token,
  body
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


# Create Card Pin Token

Generate one part of a two-part token required to reveal or set a [prepaid card](page:resources/prepaid-cards) PIN using client-side authentication. The returned token is passed to either [Fetch Card PIN]($e/Client%20Side/Fetch%20Card%20PIN) or [Update Card PIN]($e/Client%20Side/Update%20Card%20PIN). For a step-by-step guide, see [Get or Set a Card PIN](page:howtos/get-or-set-a-card-pin).

```ruby
def create_card_pin_token(destination_token)
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample Generate Pin Operation Token Response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardPinTokenResult`](../../doc/models/card-pin-token-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

result = sensitive_card_operations_api.create_card_pin_token(destination_token)

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


# Get Card Pin

Reveal the current PIN for a [prepaid card](page:resources/prepaid-cards). Requires a token from [Create Card PIN Token]($e/Client%20Side/Create%20Card%20PIN%20Token) and uses client-side authentication. For a step-by-step guide, see [Get or Set a Card PIN](page:howtos/get-or-set-a-card-pin).

```ruby
def get_card_pin(destination_token,
                 body)
```

## Authentication

This endpoint requires [clientside](../../doc/auth/oauth-2-bearer-token.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `body` | [`GetCardPinRequest`](../../doc/models/get-card-pin-request.md) | Body, Required | - |

## Response Type

**200**: Example response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardPinResult`](../../doc/models/card-pin-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

body = GetCardPinRequest.new(
  operation_token: 'string'
)

result = sensitive_card_operations_api.get_card_pin(
  destination_token,
  body
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


# Set Card Pin

Set or change the PIN for a [prepaid card](page:resources/prepaid-cards), if supported by the program. Requires a token from [Create Card PIN Token]($e/Client%20Side/Create%20Card%20PIN%20Token) and uses client-side authentication. For a step-by-step guide, see [Get or Set a Card PIN](page:howtos/get-or-set-a-card-pin).

```ruby
def set_card_pin(destination_token,
                 body)
```

## Authentication

This endpoint requires [clientside](../../doc/auth/oauth-2-bearer-token.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `destination_token` | `String` | Template, Required | Auto-generated unique identifier representing a transfer destination, including prepaid cards, bank accounts, electronic wallets, and other users, prefixed with `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^dest-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `body` | [`SetCardPinRequest`](../../doc/models/set-card-pin-request.md) | Body, Required | - |

## Response Type

**200**: Example response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`CardPinResult`](../../doc/models/card-pin-result.md).

## Example Usage

```ruby
destination_token = 'dest-4aed86e2-4929-45bf-814d-9030aef21e79'

body = SetCardPinRequest.new(
  operation_token: 'string',
  pin: 'string'
)

result = sensitive_card_operations_api.set_card_pin(
  destination_token,
  body
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

