
# Prepaid Card Closed Fraud Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardClosedFraudWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`PrepaidCardBase`](../../doc/models/prepaid-card-base.md) | Required | Prepaid card — a payee's payment instrument that can be funded from a user wallet, used at point of sale, and added to mobile wallets (Apple Pay / Google Pay / Samsung Pay) where the program supports it. Each card carries a status, a network (Mastercard / Visa), a country and currency, and a list of capabilities that govern what the card can do (reveal PAN, set PIN, mobile-wallet provisioning, etc.). Token prefix `dest-` (cards share the destination-token namespace with bank-account and electronic-wallet Instruments). See [Prepaid Cards](page:resources/prepaid-cards) and [Sensitive Card Operations](page:resources/sensitive-card-operations) for the PCI-scoped flows that handle PAN, CVV, and PIN. |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_closed_fraud_webhook_request = PrepaidCardClosedFraudWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: PrepaidCardBase.new(
    token: 'dest-8a3e8d5c-f799-4b41-9f05-11bbd4b552bb',
    card_network: 'MASTERCARD',
    card_number: '554717******7287',
    card_package: 'db157bea-2930-4096-9a5b-e7f662734d64',
    country: 'US',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:06:26.0000000Z'),
    currency: 'USD',
    status: 'PENDING_ACTIVATION',
    user_token: 'user-e3874103-10bd-44cf-ab5b-1b311d57cb94',
    program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
    cvv: '***',
    expires: '05/2029',
    bank_in_details: [
      BankAccountField.new(
        key: 'BANK_ACH_ABA',
        value: '021000021',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      BankAccountField.new(
        key: 'BANK_ACH_ACCOUNT_NUMBER',
        value: '1234567890',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      )
    ],
    capabilities: [
      'BANK_IN',
      'SET_PIN',
      'APPLEPAY',
      'GOOGLEPAY',
      'SAMSUNGPAY'
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

