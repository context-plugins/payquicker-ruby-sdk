
# Payment Job Cancelled Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobCancelledWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`PaymentJobBase`](../../doc/models/payment-job-base.md) | Required | Payment job — a CSV-uploaded batch that produces one payment quote per row. Carries the file metadata (filename, total / valid / invalid record counts), an optional `notBefore` schedule, and a status that tracks the job from `CREATED` through `COMPLETED`. The individual payment quotes produced by the job are searchable via [`POST /transfers/search`]($e/Transfers/Search%20Transfers) with a job-token filter. Token prefix `jobs-`. See [Payment Jobs](page:resources/payment-jobs) and [Run a Batch Payment Job](page:howtos/run-a-batch-payment-job). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_cancelled_webhook_request = PaymentJobCancelledWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: PaymentJobBase.new(
    token: 'jobs-1151378b-ec9f-44f0-8179-6d6e877430ac',
    portal_id: 'ARCL1BBG6RS1YK8W0',
    filename: 'API_94ae6946-1891-47a8-bf91-c789ed9de028.txt',
    created_at: DateTimeHelper.from_rfc3339('2026-04-06T13:13:24.0000000Z'),
    total_count: 105,
    valid_count: 100,
    invalid_count: 0,
    type: 'PAYMENTS',
    status: 'COMPLETED',
    not_before: DateTimeHelper.from_rfc3339('2024-07-07T00:00:00.0000000Z'),
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

