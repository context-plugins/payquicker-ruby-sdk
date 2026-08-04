
# Invitation Job Base

Invitation job — a CSV-uploaded batch that produces one invitation per row. Carries the file metadata (filename, total / valid / invalid record counts) and a status that tracks the job from `CREATED` through `COMPLETED`. The individual invitations produced by the job are searchable via [`POST /invitations/search`]($e/Invitations/Search%20Invitations) with a job-token filter. Token prefix `jobs-`. **Invitation Jobs are a Hosted Portal concept only**. See [Invitation Jobs](page:resources/invitation-jobs).

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobBase`

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
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_base = InvitationJobBase.new(
  token: 'jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c',
  portal_id: 'ARCL1B6I34CMVKLC0',
  filename: 'API_7fc1a31f-74fe-424d-845f-b60392dfc79c.txt',
  created_at: DateTimeHelper.from_rfc3339('2026-02-07T22:23:09Z'),
  total_count: 1,
  valid_count: 1,
  invalid_count: 0,
  type: 'INVITATIONS',
  status: 'COMPLETED',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

