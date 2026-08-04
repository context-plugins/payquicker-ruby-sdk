
# Bank Account Compliance Hold Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`BankAccountComplianceHoldWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`BankAccountBase`](../../doc/models/bank-account-base.md) | Required | Bank-account [Instrument](page:resources/instruments) — a payout destination representing a payee's or company's bank account in a specific country and currency. Carries the country, currency, ownership purpose (`PERSONAL` / `BUSINESS`), the rail-specific identifying fields (routing number, account number, IBAN, etc.), and a verification status that progresses from creation through platform validation. The unified Instruments resource discriminates bank accounts vs electronic wallets via `instrumentType: BANK`. |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_compliance_hold_webhook_request = BankAccountComplianceHoldWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: BankAccountBase.new(
    token: 'dest-d1242f80-d94d-40ad-8cbb-568af10c45fb',
    instrument_type: InstrumentType::BANK,
    purpose: 'PERSONAL',
    country: 'US',
    currency: 'USD',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:56:03.0000000Z'),
    fields: [
      BankAccountField.new(
        key: 'BANK_BBAN',
        value: '****4234',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      BankAccountField.new(
        key: 'BANK_ACH_ABA',
        value: '****1863',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      BankAccountField.new(
        key: 'BENEFICIARY_NAME',
        value: 'Maybelle Volkman',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      BankAccountField.new(
        key: 'BANK_NAME',
        value: 'Central City Bank',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      )
    ],
    status: 'VERIFIED',
    type: 'CHECKING',
    method: 'US_SAMEDAY_IACH',
    address: nil,
    description: 'Primary personal checking account',
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

