
# Document Request

Request object for creating or updating a document with upload

*This model accepts additional fields of type Object.*

## Structure

`DocumentRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Required | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `fields` | [`DocumentFields`](../../doc/models/document-fields.md) | Required | Document fields for creating or updating a document |
| `upload` | `Object` | Required | Document to be uploaded |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_request = DocumentRequest.new(
  user_token: 'user-2bbfc967-d12e-4647-a887-d905172fb4bc',
  fields: DocumentFields.new(
    fields: [
      DocumentDetails.new(
        key: 'EXPIRATION_DATE',
        value: 'string',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      )
    ],
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  upload: JSON.parse('{"key1":"val1","key2":"val2"}'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

