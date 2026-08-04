
# Invitation Created Webhook Request

*This model accepts additional fields of type Object.*

## Structure

`InvitationCreatedWebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `event_type` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `payload` | [`InvitationBase`](../../doc/models/invitation-base.md) | Required | Invitation — the onboarding artifact a Hosted Portal program uses to bring a new payee onto the platform. Carries the invitation key and URL (sent to the prospective payee), the program assignment, the payee's identifying details (`programUserId` + `email`, optional name and address), and a registration-status that tracks the payee's progress from invitation through completed registration. Token prefix `invt-`. **Invitations are a Hosted Portal concept only** — API Gateway programs create users directly via `POST /users`. See [Invitations](page:resources/invitations) and [Onboard Users](page:howtos/onboard-users). |
| `timestamp` | `DateTime` | Required | Webhook event timestamp. |
| `meta` | [`WebhookMetadata`](../../doc/models/webhook-metadata.md) | Required | Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_created_webhook_request = InvitationCreatedWebhookRequest.new(
  event_type: WebhookNamespaces::BANKACCOUNTS_CREATED,
  payload: InvitationBase.new(
    program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
    key: '<INVITATION_KEY>',
    url: 'https://tenant.mypayquicker.build/Welcome?invitationId=<INVITATION_KEY>',
    status: 'PENDING',
    registration_status: 'NOT_STARTED',
    created_at: DateTimeHelper.from_rfc3339('2026-03-25T12:03:09.0000000Z'),
    program_user_id: '00f1537c-963e-4b9a-98ce-c496255002d5',
    email: 'marcel74@payquicker.testinator.com',
    token: 'invt-7f09b8e6-59d3-4c53-8a6f-8cdb1403b97d',
    currency: 'USD',
    user_token: 'user-18773ac9-83f9-4ef2-9964-71063789cad3',
    notify_user: false,
    issue_card: false,
    first_name: 'Marcel',
    last_name: 'Glover',
    language: 'en-US',
    user_type: 'INDIVIDUAL',
    date_of_birth: Date.iso8601('1985-04-15'),
    addresses: [
      AddressObject.new(
        address_type: 'RESIDENTIAL',
        address_line1: '2083 Crona Walks',
        city: 'Deangelomouth',
        region: 'VA',
        postal_code: '51456',
        country: 'US',
        address_line2: 'Suite 443'
      )
    ],
    phone_numbers: [
      PhoneNumberObject.new(
        number: '+15852282715',
        country: 'US',
        number_type: 'MOBILE'
      )
    ],
    primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
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

