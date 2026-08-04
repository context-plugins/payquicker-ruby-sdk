
# Payment Job Object

A [Payment Job](page:resources/payment-jobs) — a CSV-driven batch of payments processed asynchronously — returned with HATEOAS navigation links. Track progress via the `JOBS.UPDATED` webhook namespaces. See [Payment Jobs](page:resources/payment-jobs).

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Required, Read-only | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `filename` | `String` | Required, Read-only | The name given to a computer file in order to distinguish it from other files |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `not_before` | `DateTime` | Optional, Read-only | Transfer is scheduled and will not process before this time. ISO 8601 format. |
| `total_count` | `Integer` | Required, Read-only | Total number of records in the job file |
| `valid_count` | `Integer` | Required, Read-only | Number of valid/processable records |
| `invalid_count` | `Integer` | Required, Read-only | Number of invalid/unprocessable records |
| `type` | `String` | Required, Read-only | Kind of batch job — `PAYMENTS` for [Payment Jobs](page:resources/payment-jobs) (CSV-driven batches that produce payment quotes) or `INVITATIONS` for [Invitation Jobs](page:resources/invitation-jobs) (CSV-driven batches that produce invitations). Determines the shape of the produced items. |
| `status` | `String` | Required, Read-only | Lifecycle status of a [Payment Job](page:resources/payment-jobs) or [Invitation Job](page:resources/invitation-jobs) — values include `CREATED`, `IN_PROGRESS`, `COMPLETED`, `FAILED`, and `CANCELLED`. Subscribe to the job's `*JOBS.UPDATED` / `*JOBS.COMPLETED` / `*JOBS.FAILED` webhook namespaces for status change notifications. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_object = PaymentJobObject.new(
  token: 'jobs-1151378b-ec9f-44f0-8179-6d6e877430ac',
  portal_id: 'ARCL1BBG6RS1YK8W0',
  filename: 'API_94ae6946-1891-47a8-bf91-c789ed9de028.txt',
  created_at: DateTimeHelper.from_rfc3339('2026-04-06T13:13:24.0000000Z'),
  total_count: 105,
  valid_count: 100,
  invalid_count: 0,
  type: 'PAYMENTS',
  status: 'COMPLETED',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/jobs/payments/jobs-1151378b-ec9f-44f0-8179-6d6e877430ac',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'items' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/jobs/payments/jobs-1151378b-ec9f-44f0-8179-6d6e877430ac/items',
      method: 'GET',
      title: 'Job Items',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  not_before: DateTimeHelper.from_rfc3339('2024-07-07T00:00:00.0000000Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

