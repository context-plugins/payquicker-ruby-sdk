
# User Doc Req Item Docs Items Metadata Items

A localized field-name + field-type entry attached to a document item in a document-requirements response. Used by client UIs to render localized labels and validate values for each required document field. See [Documents](page:resources/documents).

*This model accepts additional fields of type Object.*

## Structure

`UserDocReqItemDocsItemsMetadataItems`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `data_type` | `String` | Optional | Data type of the metadata field |
| `field_type` | `String` | Optional | Type of the metadata field |
| `name` | `String` | Optional | Localized name for the metadata field, in the language specified by the request's Accept-Language header. Falls back to en-US if the requested language is unavailable. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_doc_req_item_docs_items_metadata_items = UserDocReqItemDocsItemsMetadataItems.new(
  data_type: 'string',
  field_type: 'string',
  name: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

