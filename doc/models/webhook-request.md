
# Webhook Request

Request object for creating a webhook subscription

*This model accepts additional fields of type Object.*

## Structure

`WebhookRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `namespace` | [`WebhookNamespaces`](../../doc/models/webhook-namespaces.md) | Required | Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics. |
| `url` | `String` | Required | Full path of the URI used for this object |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
webhook_request = WebhookRequest.new(
  namespace: WebhookNamespaces::BANKACCOUNTS_CREATED,
  url: 'https://your-app.example.com/webhooks/payquicker',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

