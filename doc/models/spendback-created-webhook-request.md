
# Spendback Created Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`SpendbackCreatedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`SpendbackBase`](../../doc/models/spendback-base.md) | Required | Spendback quote — pulls funds from a payee's wallet back to the program's funding account, typically when the payee uses their balance to purchase goods or services from the payer. Created via `POST /transfers` with `transferType: SPENDBACK`. Token prefix `spnd-`. Follows the standard quote / accept lifecycle. See [Transfers](page:resources/transfers). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_created_webhook_request = SpendbackCreatedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: SpendbackBase.new(
    token: 'spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
    amount: '0.50',
    formatted_amount: '$0.50 USD',
    client_spendback_ref: 'f48e4b082063492bb6e7d35408d98f83',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:01:40.0000000Z'),
    currency: 'USD',
    destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
    source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
    program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
    email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
    quote_status: 'ACCEPTED',
    transfer_type: TransferType4::SPENDBACK,
    portal_id: 'FOCL1BEC8SCDNJ2YW',
    acceptance_mode: 'AUTO_ACCEPT',
    fee: FeeConfiguration.new(
      category: 'COMPANY',
      distribution: [],
      source: 'TRANSACTION',
      total_amount: '0.50',
      transaction_amount: '0.50',
      type: 'SPENDBACK_PROCESSING_FEE',
      value_amount: '0.00',
      value_type: 'PERCENTAGE',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    memo: 'Order',
    note: 'Customer purchased company merchandise',
    receipt_status: 'COMPLETE',
    receipt_token: 'rcpt-401e7533-b973-4da6-baae-e336e540da2a',
    remaining_balance: '0.00',
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

