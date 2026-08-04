
# Document Result

Document result response combining document object and metadata

*This model accepts additional fields of type Object.*

## Structure

`DocumentResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `fields` | [`Array[DocumentDetails]`](../../doc/models/document-details.md) | Required | Array of document fields and values<br><br>**Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `filename` | `String` | Required | The name given to a computer file in order to distinguish it from other files |
| `mime_type` | `String` | Required | A label used to identify a type of data.  Acts like a file extension on the internet. |
| `token` | `String` | Required | Document token — prefix `docu-`. See [Tokens](page:concepts/working-with-tokens).<br><br>**Default**: `'docu-2053aaad-c1a5-45e2-a2da-f71287f32800'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^docu-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_result = DocumentResult.new(
  created_at: DateTimeHelper.from_rfc3339('2026-02-07T22:23:09Z'),
  fields: [
    DocumentDetails.new(
      key: 'EXPIRATION_DATE',
      value: 'string',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  filename: 'exampleFile.jpg',
  mime_type: 'image/jpeg',
  token: 'docu-2053aaad-c1a5-45e2-a2da-f71287f32800',
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
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

