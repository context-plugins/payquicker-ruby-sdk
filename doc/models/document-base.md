
# Document Base

Document — a file uploaded against a user's account for KYC, compliance, or program-required verification. Carries the file contents (base64-encoded), the original filename, the MIME type, and a per-document field set whose required keys are discovered via `POST /documents/requirements/search` for the user's country and the document type. Token prefix `docu-`. See [Documents](page:resources/documents).

*This model accepts additional fields of type Object.*

## Structure

`DocumentBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `fields` | [`Array[DocumentDetails]`](../../doc/models/document-details.md) | Required | Array of document fields and values<br><br>**Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `filename` | `String` | Required | The name given to a computer file in order to distinguish it from other files |
| `mime_type` | `String` | Required | A label used to identify a type of data.  Acts like a file extension on the internet. |
| `token` | `String` | Required | Document token — prefix `docu-`. See [Tokens](page:concepts/working-with-tokens).<br><br>**Default**: `'docu-2053aaad-c1a5-45e2-a2da-f71287f32800'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^docu-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_base = DocumentBase.new(
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
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

