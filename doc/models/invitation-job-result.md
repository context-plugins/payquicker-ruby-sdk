
# Invitation Job Result

Invitation job result response combining invitation job object and metadata

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `portal_id` | `String` | Required | Reference ID in the PayQuicker Hosted Portal, if applicable.<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `filename` | `String` | Required | The name given to a computer file in order to distinguish it from other files |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `total_count` | `Integer` | Required, Read-only | Total number of records in the job file |
| `valid_count` | `Integer` | Required, Read-only | Number of valid/processable records |
| `invalid_count` | `Integer` | Required | Number of invalid/unprocessable records |
| `type` | `String` | Required, Read-only | Kind of batch job — `PAYMENTS` for [Payment Jobs](page:resources/payment-jobs) (CSV-driven batches that produce payment quotes) or `INVITATIONS` for [Invitation Jobs](page:resources/invitation-jobs) (CSV-driven batches that produce invitations). Determines the shape of the produced items. |
| `status` | `String` | Required | Lifecycle status of a [Payment Job](page:resources/payment-jobs) or [Invitation Job](page:resources/invitation-jobs) — values include `CREATED`, `IN_PROGRESS`, `COMPLETED`, `FAILED`, and `CANCELLED`. Subscribe to the job's `*JOBS.UPDATED` / `*JOBS.COMPLETED` / `*JOBS.FAILED` webhook namespaces for status change notifications. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_result = InvitationJobResult.new(
  token: 'token8',
  portal_id: 'portalId6',
  filename: 'filename0',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  total_count: 50,
  valid_count: 48,
  invalid_count: 2,
  type: 'type2',
  status: 'status0',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

