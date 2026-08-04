
# Payment Quote Cancelled Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`PaymentQuoteCancelledWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`PaymentBase`](../../doc/models/payment-base.md) | Required | Payment quote — a payer-to-payee disbursement created via `POST /transfers` with `transferType: PAYMENT`. Token prefix `pmnt-`. Follows the standard quote / accept lifecycle: creation returns the quote in `PENDING_ACCEPTANCE`; a separate `POST /transfers/{token}/accept` (or `acceptanceMode: AUTO_ACCEPT` on creation) executes it. See [Transfers](page:resources/transfers). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_quote_cancelled_webhook_request = PaymentQuoteCancelledWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: PaymentBase.new(
    token: 'pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
    amount: '2.00',
    formatted_amount: '$2.00 USD',
    client_payment_ref: 'e53e963f051f4aa588a7515f13c82f3a',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:50.0000000Z'),
    currency: 'USD',
    program_user_id: 'PQAPI-a6f83b0f903fc540ee1cb41ed137983c',
    email: 'dyn1bec8scdnj2zk__alberta7@payquicker.testinator.com',
    source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
    quote_status: 'PENDING_ACCEPTANCE',
    transfer_type: TransferType::PAYMENT,
    portal_id: 'FOCL1BEC8SCDNJ2ZK',
    acceptance_mode: 'MANUAL_ACCEPT',
    destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
    memo: 'Q2 performance bonus',
    note: 'Reissued after retracted payment',
    purpose: 'BONUS',
    receipt_status: 'COMPLETE',
    receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
    not_before: DateTimeHelper.from_rfc3339('2026-05-03T00:00:00.0000000Z'),
    not_after: DateTimeHelper.from_rfc3339('2026-06-03T00:00:00.0000000Z'),
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

