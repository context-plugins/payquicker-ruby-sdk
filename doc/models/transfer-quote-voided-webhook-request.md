
# Transfer Quote Voided Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`TransferQuoteVoidedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`TransferBase`](../../doc/models/transfer-base.md) | Required | Transfer quote — bank, card, or user-to-user wallet movement. Created via `POST /transfers` with `transferType: TRANSFER`. Token prefix `xfer-`. **API Gateway only**; Hosted Portal programs do not use `transferType: TRANSFER`. Follows the standard quote / accept lifecycle. See [Transfers](page:resources/transfers). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
transfer_quote_voided_webhook_request = TransferQuoteVoidedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: TransferBase.new(
    token: 'xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
    client_transfer_ref: 'c23a4e8c-7f0f-47ea-b833-fc985e01051d',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:34.0000000Z'),
    amount: '-0.01',
    formatted_amount: '($0.01) USD',
    currency: 'USD',
    destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
    source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
    program_user_id: 'PQAPI-01866a624144f0e5f05e18de0c72d8a9',
    email: 'dyn1bec8scdnj2z4__neva_block@payquicker.testinator.com',
    quote_status: 'ACCEPTED',
    transfer_type: TransferType7::TRANSFER,
    portal_id: 'FOCL1BEC8SCDNJ2ZM',
    delivery_details: DeliveryDetails.new(
      minimum_delivery_minutes: 4,
      maximum_delivery_minutes: 152,
      expected_delivery: 'SAME_DAY',
      expected_delivery_time: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    acceptance_mode: 'MANUAL_ACCEPT',
    fee: FeeConfiguration.new(
      category: 'COMPANY',
      distribution: [],
      source: 'TRANSACTION',
      total_amount: '0.00',
      transaction_amount: '0.00',
      type: 'BANK_TRANSFER',
      value_amount: '0.00',
      value_type: 'PERCENTAGE',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    fx_rate: FxRate.new(
      destination_amount: '-0.01',
      destination_currency: 'USD',
      destination_formatted_amount: '($0.01) USD',
      rate: '1.00',
      source_amount: '-0.01',
      source_currency: 'USD',
      source_formatted_amount: '($0.01) USD',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    memo: 'Q1 incentive transfer',
    note: 'Reissued after retraction',
    receipt_status: 'COMPLETE',
    receipt_token: 'rcpt-0838989a-7a5c-4e87-8466-ed1a7d31d9c0',
    lockside: 'SOURCE',
    method: 'ACCOUNT_TO_ACCOUNT_TRANSFER',
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

