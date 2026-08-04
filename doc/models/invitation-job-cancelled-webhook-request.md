
# Invitation Job Cancelled Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobCancelledWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`InvitationJobBase`](../../doc/models/invitation-job-base.md) | Required | Invitation job — a CSV-uploaded batch that produces one invitation per row. Carries the file metadata (filename, total / valid / invalid record counts) and a status that tracks the job from `CREATED` through `COMPLETED`. The individual invitations produced by the job are searchable via [`POST /invitations/search`]($e/Invitations/Search%20Invitations) with a job-token filter. Token prefix `jobs-`. **Invitation Jobs are a Hosted Portal concept only**. See [Invitation Jobs](page:resources/invitation-jobs). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_cancelled_webhook_request = InvitationJobCancelledWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: InvitationJobBase.new(
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
  ),
  timestamp: DateTimeHelper.from_rfc3339('2026-02-07T22:23:10Z'),
  meta: WebhookMetadata.new(
    meta: WebhookMetadataItems.new(
      timezone: 'UTC',
      language: 'en-US',
      version: '2026.02.01',
      additional_properties: {
        'requestRef' => JSON.parse('"20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh"')
      }
    ),
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

