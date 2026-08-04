
# User Event Updated Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`UserEventUpdatedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`UserBase`](../../doc/models/user-base.md) | Required | User — a payee on a PayQuicker program. Hosted Portal programs onboard users via [invitations](page:resources/invitations); API Gateway programs create users directly via `POST /users`. The same record carries shared profile fields (name, email, addresses, phone) plus type-specific fields for `INDIVIDUAL` vs `BUSINESS` users (nullable and omitted from responses when not applicable). See [Users](page:resources/users). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_event_updated_webhook_request = UserEventUpdatedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: UserBase.new(
    token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
    created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:59:08.0000000Z'),
    status: 'ACTIVE',
    program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
    program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
    email: 'edd_glover44@payquicker.testinator.com',
    first_name: 'Edd',
    last_name: 'Glover',
    date_of_birth: Date.iso8601('2000-05-03'),
    user_type: 'INDIVIDUAL',
    language: 'en-US',
    addresses: [
      AddressObject.new(
        address_type: 'RESIDENTIAL',
        address_line1: '2083 Crona Walks',
        city: 'Deangelomouth',
        region: 'VA',
        postal_code: '51456',
        country: 'US',
        address_line2: 'Suite 443',
        address_line3: 'Deangelomouth VA  51456'
      ),
      AddressObject.new(
        address_type: 'MAILING',
        address_line1: '9307 Kris Haven',
        city: 'New Darrion',
        region: 'SC',
        postal_code: '65707',
        country: 'US',
        address_line2: 'Suite 010'
      )
    ],
    phone_numbers: [
      PhoneNumberObject.new(
        number: '+15852282715',
        country: 'US',
        number_type: 'PRIMARY'
      ),
      PhoneNumberObject.new(
        number: '+15852282715',
        country: 'US',
        number_type: 'MOBILE'
      )
    ],
    gender: 'NOT_SPECIFIED',
    country_of_birth: 'US',
    country_of_nationality: 'US',
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

