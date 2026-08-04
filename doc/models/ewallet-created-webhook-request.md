
# Ewallet Created Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`EwalletCreatedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`EwalletBase`](../../doc/models/ewallet-base.md) | Required | Electronic-wallet [Instrument](page:resources/instruments) — a payout destination representing a payee's account on a third-party wallet provider (e.g., PayPal, Venmo, Airtel Money). Carries the provider type, country, currency, the provider-specific identifying fields (account ID, phone number, etc.), and a verification status. The unified Instruments resource discriminates electronic wallets vs bank accounts via `instrumentType: EWALLET`. |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_created_webhook_request = EwalletCreatedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: EwalletBase.new(
    token: 'dest-9d5b926a-6d16-4371-9533-b9c87bb64258',
    instrument_type: InstrumentType1::EWALLET,
    type: 'ALIPAY',
    country: 'CN',
    currency: 'CNY',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:57:12.0000000Z'),
    status: 'VERIFIED',
    fields: [
      EwalletField.new(
        key: 'GOVERNMENT_ID',
        value: '****5678',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      )
    ],
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

