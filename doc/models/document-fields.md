
# Document Fields

Document fields for creating or updating a document

*This model accepts additional fields of type Object.*

## Structure

`DocumentFields`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `fields` | [`Array[DocumentDetails]`](../../doc/models/document-details.md) | Optional | Array of document field key-value pairs |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_fields = DocumentFields.new(
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
)
```

