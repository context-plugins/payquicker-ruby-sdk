
# Webhook Subscription Base

A single [Webhook Subscription](page:resources/webhook-subscriptions) — the binding between a webhook event namespace and the URL where the platform delivers it, plus the HMAC secret for signature verification. See [Webhooks](page:concepts/available-webhooks) and [Event Notifications](page:concepts/working-with-event-notifications).

*This model accepts additional fields of type Object.*

## Structure

`WebhookSubscriptionBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `last_updated` | `DateTime` | Optional, Read-only | Date and time that the object was last updated |
| `url` | `String` | Required | Full path of the URI used for this object |
| `namespace` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `status` | `String` | Required, Read-only | Statuses a webhook subscription can have. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
webhook_subscription_base = WebhookSubscriptionBase.new(
  token: 'webh-ab40b884-dcf7-4a82-9b7c-2002de79ebec',
  created_at: DateTimeHelper.from_rfc3339('2024-02-20T20:26:15.0000000Z'),
  url: 'https://platform.mypayquicker.dev/integrations/velocitywebhooktesting?companyUserId=1229101',
  namespace: WebhookNamespaces::PAYMENTQUOTES_CREATED,
  status: 'SUBSCRIBED',
  last_updated: DateTimeHelper.from_rfc3339('2026-05-02T23:06:38.0000000Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

