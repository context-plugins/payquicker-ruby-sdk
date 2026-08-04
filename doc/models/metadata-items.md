
# Metadata Items

Metadata items including timezone, language, and version information

*This model accepts additional fields of type Object.*

## Structure

`MetadataItems`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `timezone` | `String` | Required | Timezone of the datetime objects in the response |
| `language` | `String` | Required | Language used for localized content in this response, determined by the Accept-Language request header. Falls back to en-US if the requested language is unavailable. |
| `version` | `String` | Required | API version of the response object, in YYYY.MM.DD format |
| `request_ref` | `String` | Required | - |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
metadata_items = MetadataItems.new(
  timezone: 'UTC',
  language: 'en-US',
  version: '2026.02.01',
  request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

