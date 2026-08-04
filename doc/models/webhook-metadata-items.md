
# Webhook Metadata Items

Metadata items including timezone, language, and version information

*This model accepts additional fields of type Object.*

## Structure

`WebhookMetadataItems`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timezone` | `String` | Required | Timezone of the datetime objects in the response |
| `language` | `String` | Required | Language used for localized content in this response, determined by the Accept-Language request header. Falls back to en-US if the requested language is unavailable. |
| `version` | `String` | Required | API version of the response object, in YYYY.MM.DD format |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
webhook_metadata_items = WebhookMetadataItems.new(
  timezone: 'UTC',
  language: 'en-US',
  version: '2026.02.01',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

