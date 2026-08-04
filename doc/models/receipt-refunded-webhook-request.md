
# Receipt Refunded Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`ReceiptRefundedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`ReceiptBase`](../../doc/models/receipt-base.md) | Required | Receipt — a settled transaction on the platform. Created when a transfer quote is accepted (`POST /transfers/{token}/accept`), a prepaid-card authorization clears, or a fee posts to an account. The receipt records the parties, the amount, the timing, and the terminal status of the underlying transaction. Token prefix `rcpt-`. See [Receipts](page:resources/receipts). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_refunded_webhook_request = ReceiptRefundedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: ReceiptBase.new(
    token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
    type: 'PAYMENT_RETRACTION',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:37.0000000Z'),
    sign: 'DEBIT',
    source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
    portal_id: 'FOCL1BEC8SCDNJ31J',
    amount: '-2.00',
    formatted_amount: '($2.00) USD',
    currency: 'USD',
    status: 'COMPLETE',
    description: 'Retraction for FOCL1BEC8SCDNJ31G',
    destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
    program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
    email: 'alberta.purdy@payquicker.testinator.com',
    delivery_details: DeliveryDetails.new(
      minimum_delivery_minutes: 4,
      maximum_delivery_minutes: 152,
      expected_delivery: 'SAME_DAY',
      expected_delivery_time: DateTimeHelper.from_rfc3339('0001-01-01T21:00:00Z'),
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    details: ReceiptDetails.new(
      bank_account_id: '021000021',
      bank_account_id_type: 'BANK_ACH_ABA',
      bank_name: 'JPMorgan Chase Bank',
      bank_id: '021000021',
      bank_id_type: 'BANK_ACH_ABA',
      beneficary_name: 'Alberta Purdy',
      memo: 'Retraction for original payment',
      note: 'Retraction Initiated By Company',
      correlation_token: 'pmnt-7d631de0-3467-4ece-b408-29dc748ed615',
      processor_reference: 'c3c600111b62426797e8596bd1dcaa5f',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    fx_rate: FxRate.new(
      destination_amount: '-2.00',
      destination_currency: 'USD',
      destination_formatted_amount: '($2.00) USD',
      rate: '1.00',
      source_amount: '-2.00',
      source_currency: 'USD',
      source_formatted_amount: '($2.00) USD'
    ),
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

