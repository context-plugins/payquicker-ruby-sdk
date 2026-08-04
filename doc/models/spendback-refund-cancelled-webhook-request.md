
# Spendback Refund Cancelled Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`SpendbackRefundCancelledWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`SpendbackRefundBase`](../../doc/models/spendback-refund-base.md) | Required | Spendback refund quote — reverses an accepted spendback by sending the funds back to the payee. Created via `POST /transfers` with `transferType: REFUND`. Token prefix `rfnd-`. Follows the standard quote / accept lifecycle. See [Transfers](page:resources/transfers). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_refund_cancelled_webhook_request = SpendbackRefundCancelledWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: SpendbackRefundBase.new(
    token: 'rfnd-8975eb51-1baf-4549-a1d3-93f4f03d9c96',
    amount: '2.00',
    formatted_amount: '$2.00 USD',
    client_refund_ref: 'f2dfcbc1369d44268888b6590756a79a',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:05:48.0000000Z'),
    currency: 'USD',
    source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
    destination_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
    spendback_token: 'spnd-ae020490-edc1-4f96-b584-f989685a08bc',
    program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
    email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
    quote_status: 'PENDING_ACCEPTANCE',
    transfer_type: TransferType10::REFUND,
    portal_id: 'FOCL1BEC8SCDNJ32B',
    acceptance_mode: 'MANUAL_ACCEPT',
    memo: 'Customer return — restocking',
    note: 'Funds returned to payee wallet',
    spendback_portal_id: 'FOCL1BEC8SCDNJ32A',
    client_spendback_ref: 'ac7d1dd70ac04100b59546f31863b139',
    receipt_status: 'COMPLETE',
    receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
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

