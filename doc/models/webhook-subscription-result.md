
# Webhook Subscription Result

Webhook subscription result response combining webhook subscription object and metadata

*This model accepts additional fields of type Object.*

## Structure

`WebhookSubscriptionResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `last_updated` | `DateTime` | Optional, Read-only | Date and time that the object was last updated |
| `url` | `String` | Required | Full path of the URI used for this object |
| `namespace` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `status` | `String` | Required, Read-only | Statuses a webhook subscription can have. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
webhook_subscription_result = WebhookSubscriptionResult.new(
  token: 'token8',
  created_at: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  url: 'string',
  namespace: WebhookNamespaces::BANKACCOUNTS_CREATED,
  status: 'status6',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  last_updated: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

