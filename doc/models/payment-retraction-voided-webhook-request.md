
# Payment Retraction Voided Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`PaymentRetractionVoidedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`PaymentRetractionBase`](../../doc/models/payment-retraction-base.md) | Required | Payment retraction quote — reverses an accepted payment by returning the funds to the source account. Conceptually similar to a payment reversal in card-acquiring or a transfer cancellation in cross-border. Created via `POST /transfers` with `transferType: RETRACTION`. Token prefix `retx-`. Follows the standard quote / accept lifecycle. See [Transfers](page:resources/transfers). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_retraction_voided_webhook_request = PaymentRetractionVoidedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: PaymentRetractionBase.new(
    token: 'retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50',
    amount: '2.00',
    formatted_amount: '$2.00 USD',
    client_retraction_ref: 'c0f8bdcaf7c647d0be2ecf9e1d646cc8',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:09.0000000Z'),
    currency: 'USD',
    source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
    destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
    payment_token: 'pmnt-240b953b-6276-4a1b-b982-61122bde3638',
    client_payment_ref: 'c125739e6fbb471987b474fa3527dcb5',
    program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
    email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
    quote_status: 'PENDING_ACCEPTANCE',
    transfer_type: TransferType5::RETRACTION,
    portal_id: 'FOCL1BEC8SCDNJ307',
    acceptance_mode: 'MANUAL_ACCEPT',
    allow_partial: false,
    memo: 'Customer charge dispute',
    note: 'Funds reversed to source account',
    payment_retraction_portal_id: 'FOCL1BEC8SCDNJ306',
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

