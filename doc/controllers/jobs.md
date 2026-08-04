# Jobs

# Jobs

---


The *Jobs* tag groups the platform's batch-processing endpoints. There are two distinct job concepts that share a uniform API shape:

* **Payment Jobs** — disburse many [transfers](page:resources/transfers) (with `transferType: PAYMENT`) in a single batch by uploading a CSV. Available to both program types.
* **Invitation Jobs** — send many invitations in a single batch. Available to Hosted Portal programs only.

Jobs are uniformly identified by a `jobs-` token regardless of kind.

With this resource, you can perform the following requests:

**Payment Jobs:**

* `POST /jobs/payments` — Create a Payment Job (CSV upload)
* `GET /jobs/payments/{job-token}` — Fetch a Payment Job
* `DELETE /jobs/payments/{job-token}` — Cancel a Payment Job
* `GET /jobs/payments/{job-token}/items` — List the items of a single Payment Job (convenience read)
* `POST /jobs/payments/search` + `GET /jobs/payments/search/{searchId}` — Search Payment Jobs

**Invitation Jobs:**

* `POST /jobs/invitations` — Create an Invitation Job (CSV upload)
* `GET /jobs/invitations/{job-token}` — Fetch an Invitation Job
* `GET /jobs/invitations/{job-token}/items` — List the items of a single Invitation Job (convenience read)
* `POST /jobs/invitations/search` + `GET /jobs/invitations/search/{searchId}` — Search Invitation Jobs

> To search the **items** of jobs (rather than the jobs themselves), use the parent resource's search with a job-token filter: `POST /transfers/search` for payment-job items; `POST /invitations/search` for invitation-job items.

For more information, see [Payment Jobs](page:resources/payment-jobs) and [Invitation Jobs](page:resources/invitation-jobs). For a step-by-step guide, see [Run a Batch Payment Job](page:howtos/run-a-batch-payment-job).

```ruby
jobs_api = client.jobs
```

## Class Name

`JobsApi`

## Methods

* [Post-Paymentjobs](../../doc/controllers/jobs.md#post-paymentjobs)
* [Get-Jobs-Paymentjob Token](../../doc/controllers/jobs.md#get-jobs-paymentjob-token)
* [Delete-Paymentjobs-Jobs Token](../../doc/controllers/jobs.md#delete-paymentjobs-jobs-token)
* [Get-Jobs-Paymentjob Token-Items](../../doc/controllers/jobs.md#get-jobs-paymentjob-token-items)
* [Post-Invitationjobs](../../doc/controllers/jobs.md#post-invitationjobs)
* [Get-Jobs-Invitationjob Token](../../doc/controllers/jobs.md#get-jobs-invitationjob-token)
* [Get-Jobs-Invitationjob Token-Items](../../doc/controllers/jobs.md#get-jobs-invitationjob-token-items)
* [Search Payment Jobs](../../doc/controllers/jobs.md#search-payment-jobs)
* [Read Payment Job Search](../../doc/controllers/jobs.md#read-payment-job-search)
* [Search Invitation Jobs](../../doc/controllers/jobs.md#search-invitation-jobs)
* [Read Invitation Job Search](../../doc/controllers/jobs.md#read-invitation-job-search)


# Post-Paymentjobs

Create a [payment job](page:resources/payment-jobs) to process a batch of payments in a single operation. Upload a batch file containing multiple payment instructions and the system will process them asynchronously. For a step-by-step guide, see [Run a Batch Payment Job](page:howtos/run-a-batch-payment-job).

```ruby
def post_paymentjobs(body,
                     accept_language: 'en-US',
                     accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [Gateway Payment Job](../../doc/models/gateway-payment-job.md) \| [Portal Payment Job](../../doc/models/portal-payment-job.md) | Body, Required | Payment job wrapper for batch payment operations |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample payment job response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`PaymentJobResult`](../../doc/models/payment-job-result.md).

## Example Usage

```ruby
body = GatewayPaymentJob.new(
  items: [
    GatewayPaymentJobQuote.new(
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
      amount: '150.00',
      client_payment_ref: 'ref-001',
      transfer_type: TransferType::PAYMENT,
      memo: 'Q2 incentive bonus',
      purpose: 'BONUS',
      additional_properties: {
        'acceptanceMode' => JSON.parse('"AUTO_ACCEPT"')
      }
    ),
    GatewayPaymentJobQuote.new(
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
      amount: '75.00',
      client_payment_ref: 'ref-002',
      transfer_type: TransferType::PAYMENT,
      memo: 'Q2 incentive bonus',
      purpose: 'BONUS',
      additional_properties: {
        'acceptanceMode' => JSON.parse('"AUTO_ACCEPT"')
      }
    )
  ],
  not_before: DateTimeHelper.from_rfc3339('2026-05-10T00:00:00Z')
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.post_paymentjobs(
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


# Get-Jobs-Paymentjob Token

Fetch a single [payment job](page:resources/payment-jobs) by its job token. Returns the job status, progress, and summary of processed payments.

```ruby
def get_jobs_paymentjob_token(job_token,
                              accept_language: 'en-US',
                              accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_token` | `String` | Template, Required | A token representing the job. This must be a `jobs-` [token](page:concepts/working-with-tokens). For example jobs-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^jobs-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample payment job response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`PaymentJobResult`](../../doc/models/payment-job-result.md).

## Example Usage

```ruby
job_token = 'jobs-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.get_jobs_paymentjob_token(
  job_token,
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


# Delete-Paymentjobs-Jobs Token

Cancel a submitted [payment job](page:resources/payment-jobs) that has not yet completed processing.

```ruby
def delete_paymentjobs_jobs_token(job_token,
                                  accept_language: 'en-US',
                                  accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_token` | `String` | Template, Required | A token representing the job. This must be a `jobs-` [token](page:concepts/working-with-tokens). For example jobs-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^jobs-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**201**: Sample payment job response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`PaymentJobResult`](../../doc/models/payment-job-result.md).

## Example Usage

```ruby
job_token = 'jobs-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.delete_paymentjobs_jobs_token(
  job_token,
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


# Get-Jobs-Paymentjob Token-Items

Fetch a paginated list of individual payment items within a [payment job](page:resources/payment-jobs). Each item includes the payment details, job-specific context (line number, parent job association), and any validation or processing exceptions. Supports [filtering](page:concepts/filtering-sorting), [sorting](page:concepts/filtering-sorting#sorting), and [pagination](page:concepts/pagination) through existing mechanisms. Use the `format` parameter to choose between JSON (default) and a tab-delimited flat file download, and the `results` parameter to filter by valid, invalid, or all items.

```ruby
def get_jobs_paymentjob_token_items(job_token,
                                    page,
                                    page_size,
                                    accept_language: 'en-US',
                                    format: nil,
                                    results: nil,
                                    accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_token` | `String` | Template, Required | A token representing the job. This must be a `jobs-` [token](page:concepts/working-with-tokens). For example jobs-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^jobs-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `page` | `Integer` | Query, Required | Page number of specific page to return. See [Pagination](page:concepts/pagination) for details on paging through results.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Query, Required | Number of items to be displayed per page. Maximum of 50. See [Pagination](page:concepts/pagination) for details.<br><br>**Constraints**: `>= 1`, `<= 50` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `format` | `String` | Query, Optional | Output format for the job response. Use `json` (default) for a standard JSON response, or `file` for a tab-delimited (TSV) flat file download containing the job items. |
| `results` | `String` | Query, Optional | Filter the items returned in the job response. Use `all` (default) to return all items, `valid` to return only successfully processed items, or `invalid` to return only failed items. |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample payment job items list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`PaymentJobItemListResult`](../../doc/models/payment-job-item-list-result.md).

## Example Usage

```ruby
job_token = 'jobs-2bbfc967-d12e-4647-a887-d905172fb4bc'

page = 1

page_size = 20

accept_language = 'en-US'

format = '{\n  "json": {\n    "value": "json",\n    "summary": "JSON format"\n  }\n}'

results = '{\n  "all": {\n    "value": "all",\n    "summary": "Return all items"\n  }\n}'

accept_timezone = 'America/New_York'

result = jobs_api.get_jobs_paymentjob_token_items(
  job_token,
  page,
  page_size,
  accept_language: accept_language,
  format: format,
  results: results,
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


# Post-Invitationjobs

Create an [invitation job](page:resources/invitation-jobs) to send invitations in bulk. This is available for [Hosted Portal](page:concepts/program-types#hosted-portal-programs) programs only.

```ruby
def post_invitationjobs(body,
                        accept_language: 'en-US',
                        accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`InvitationJobRequest`](../../doc/models/invitation-job-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`modify`

## Response Type

**200**: Sample invitation job response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationJobResult`](../../doc/models/invitation-job-result.md).

## Example Usage

```ruby
body = InvitationJobRequest.new(
  items: [
    IndividualUserInvitation.new(
      program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
      program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
      email: 'marcel74@payquicker.testinator.com',
      issue_card: false,
      user_type: UserType::INDIVIDUAL,
      notify_user: true,
      first_name: 'Marcel',
      last_name: 'Glover',
      date_of_birth: Date.iso8601('1985-04-15'),
      language: 'en-US',
      country_of_birth: 'US',
      country_of_nationality: 'US',
      addresses: [
        AddressObject.new(
          address_type: 'RESIDENTIAL',
          address_line1: '2083 Crona Walks',
          city: 'Deangelomouth',
          region: 'VA',
          postal_code: '51456',
          country: 'US'
        )
      ],
      phone_numbers: [
        PhoneNumberObject.new(
          number: '+15852282715',
          country: 'US',
          number_type: 'MOBILE'
        )
      ]
    ),
    BusinessUserInvitation.new(
      program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
      program_user_id: 'PQAPI-04567a8983e1a44a1c8d1e02ab3f9b21',
      email: 'ops@acmemerch.com',
      issue_card: false,
      user_type: UserType1::BUSINESS,
      notify_user: true,
      first_name: 'Marcel',
      last_name: 'Glover',
      date_of_birth: Date.iso8601('1985-04-15'),
      contact_role: 'AUTHORIZED_SIGNER',
      business_name: 'ACME Merchandise LLC',
      language: 'en-US',
      addresses: [
        AddressObject.new(
          address_type: 'BUSINESS',
          address_line1: '9307 Kris Haven',
          city: 'New Darrion',
          region: 'SC',
          postal_code: '65707',
          country: 'US'
        )
      ],
      phone_numbers: [
        PhoneNumberObject.new(
          number: '+15852282715',
          country: 'US',
          number_type: 'BUSINESS'
        )
      ]
    )
  ]
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.post_invitationjobs(
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


# Get-Jobs-Invitationjob Token

Fetch a single [invitation job](page:resources/invitation-jobs) by its job token. Returns the job status, progress, and summary of processed invitations.

```ruby
def get_jobs_invitationjob_token(job_token,
                                 accept_language: 'en-US',
                                 accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_token` | `String` | Template, Required | A token representing the job. This must be a `jobs-` [token](page:concepts/working-with-tokens). For example jobs-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^jobs-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample invitation job response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationJobResult`](../../doc/models/invitation-job-result.md).

## Example Usage

```ruby
job_token = 'jobs-2bbfc967-d12e-4647-a887-d905172fb4bc'

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.get_jobs_invitationjob_token(
  job_token,
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


# Get-Jobs-Invitationjob Token-Items

Fetch a paginated list of individual invitation items within an [invitation job](page:resources/invitation-jobs). Each item includes the invitation details, job-specific context (line number, parent job association), and any validation or processing exceptions. Supports [filtering](page:concepts/filtering-sorting), [sorting](page:concepts/filtering-sorting#sorting), and [pagination](page:concepts/pagination) through existing mechanisms. Use the `format` parameter to choose between JSON (default) and a tab-delimited flat file download, and the `results` parameter to filter by valid, invalid, or all items.

```ruby
def get_jobs_invitationjob_token_items(job_token,
                                       page,
                                       page_size,
                                       accept_language: 'en-US',
                                       format: nil,
                                       results: nil,
                                       accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_token` | `String` | Template, Required | A token representing the job. This must be a `jobs-` [token](page:concepts/working-with-tokens). For example jobs-2bbfc967-d12e-4647-a887-d905172fb4bc.<br><br>**Constraints**: *Pattern*: `^jobs-[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$` |
| `page` | `Integer` | Query, Required | Page number of specific page to return. See [Pagination](page:concepts/pagination) for details on paging through results.<br><br>**Constraints**: `>= 1` |
| `page_size` | `Integer` | Query, Required | Number of items to be displayed per page. Maximum of 50. See [Pagination](page:concepts/pagination) for details.<br><br>**Constraints**: `>= 1`, `<= 50` |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `format` | `String` | Query, Optional | Output format for the job response. Use `json` (default) for a standard JSON response, or `file` for a tab-delimited (TSV) flat file download containing the job items. |
| `results` | `String` | Query, Optional | Filter the items returned in the job response. Use `all` (default) to return all items, `valid` to return only successfully processed items, or `invalid` to return only failed items. |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample invitation job items list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationJobItemListResult`](../../doc/models/invitation-job-item-list-result.md).

## Example Usage

```ruby
job_token = 'jobs-2bbfc967-d12e-4647-a887-d905172fb4bc'

page = 1

page_size = 20

accept_language = 'en-US'

format = '{\n  "json": {\n    "value": "json",\n    "summary": "JSON format"\n  }\n}'

results = '{\n  "all": {\n    "value": "all",\n    "summary": "Return all items"\n  }\n}'

accept_timezone = 'America/New_York'

result = jobs_api.get_jobs_invitationjob_token_items(
  job_token,
  page,
  page_size,
  accept_language: accept_language,
  format: format,
  results: results,
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


# Search Payment Jobs

Search for [payment jobs](page:resources/payment-jobs) using structured filter criteria in the request body.

```ruby
def search_payment_jobs(body,
                        accept_language: 'en-US',
                        accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`PaymentJobSearchRequest`](../../doc/models/payment-job-search-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample payment job list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`PaymentJobSearchResult`](../../doc/models/payment-job-search-result.md).

## Example Usage

```ruby
body = PaymentJobSearchRequest.new(
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.search_payment_jobs(
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


# Read Payment Job Search

Retrieve a specific page of results from a previous payment job search request.

```ruby
def read_payment_job_search(search_id,
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

**200**: Sample payment job list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`PaymentJobSearchResult`](../../doc/models/payment-job-search-result.md).

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.read_payment_job_search(
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


# Search Invitation Jobs

Search for [invitation jobs](page:resources/invitation-jobs) using structured filter criteria. Invitation jobs are a [Hosted Portal](page:concepts/program-types#hosted-portal-programs) program concept only.

```ruby
def search_invitation_jobs(body,
                           accept_language: 'en-US',
                           accept_timezone: 'UTC')
```

## Authentication

This endpoint requires [server](../../doc/auth/oauth-2-client-credentials-grant.md)

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`InvitationJobSearchRequest`](../../doc/models/invitation-job-search-request.md) | Body, Required | - |
| `accept_language` | `String` | Header, Optional | Header parameter that selects the response language for localized fields (e.g., user-facing event descriptions). Accepts a [BCP 47](https://www.rfc-editor.org/info/bcp47) language tag — see [Localization](page:concepts/localization-parameters) and [Supported Languages](page:additional-api-information/supported-languages) for the value list.<br><br>**Default**: `'en-US'` |
| `accept_timezone` | `String` | Header, Optional | Header parameter that selects the timezone applied to date/time values in the response. Accepts an IANA timezone identifier — see [Timezone Parameters](page:concepts/timezone-parameters) and [Supported Timezones](page:additional-api-information/supported-timezones) for the value list.<br><br>**Default**: `'UTC'` |

## Requires scope

### server

`readonly`

## Response Type

**200**: Sample invitation job list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationJobSearchResult`](../../doc/models/invitation-job-search-result.md).

## Example Usage

```ruby
body = InvitationJobSearchRequest.new(
  filters: [],
  sort: [],
  page: 1,
  page_size: 50
)

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.search_invitation_jobs(
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


# Read Invitation Job Search

Retrieve a specific page of results from a previous invitation job search request.

```ruby
def read_invitation_job_search(search_id,
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

**200**: Sample invitation job list response

This method returns an [`ApiResponse`](../../doc/api-response.md) instance. The `data` property of this instance returns the response data which is of type [`InvitationJobSearchResult`](../../doc/models/invitation-job-search-result.md).

## Example Usage

```ruby
search_id = '550e8400-e29b-41d4-a716-446655440000'

page = 1

page_size = 20

accept_language = 'en-US'

accept_timezone = 'America/New_York'

result = jobs_api.read_invitation_job_search(
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

