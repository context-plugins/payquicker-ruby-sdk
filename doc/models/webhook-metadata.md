
# Webhook Metadata

Metadata wrapper returned on every webhook delivery — carries the event namespace, delivery ID, signature inputs, and timestamp. See [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency / replay-attack handling.

*This model accepts additional fields of type Object.*

## Structure

`WebhookMetadata`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `meta` | [`WebhookMetadataItems`](../../doc/models/webhook-metadata-items.md) | Optional | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
webhook_metadata = WebhookMetadata.new(
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
)
```

