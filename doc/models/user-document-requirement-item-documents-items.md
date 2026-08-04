
# User Document Requirement Item Documents Items

A document item nested inside a `UserDocumentRequirementItem` — includes example images, accepted file formats, and per-field metadata. See [Documents](page:resources/documents).

*This model accepts additional fields of type Object.*

## Structure

`UserDocumentRequirementItemDocumentsItems`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `example_image` | `String` | Optional | Full path of the URI used for this object |
| `supplemental_documents` | [`Array[UserDocReqItemDocsItemsSupplementalDocsItems]`](../../doc/models/user-doc-req-item-docs-items-supplemental-docs-items.md) | Optional | Additional documents that may be required |
| `metadata` | [`Array[UserDocReqItemDocsItemsMetadataItems]`](../../doc/models/user-doc-req-item-docs-items-metadata-items.md) | Optional | Metadata fields for the document |
| `status` | `String` | Optional | Review status of a [Document](page:resources/documents) submitted for KYC or business verification — values progress from `NOT_PROVIDED` → `PROVIDED` → `UNDER_REVIEW` → `APPROVED` or `REJECTED`. See [Document Status Types](page:additional-api-information/document-status-types) for the full list and meaning of each value. |
| `type` | `String` | Optional | Kind of [document](page:resources/documents) being uploaded — for example, government ID, proof of address, business registration. Required document types vary by user country and scenario; discover them via `POST /documents/requirements/search`. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_document_requirement_item_documents_items = UserDocumentRequirementItemDocumentsItems.new(
  example_image: 'string',
  supplemental_documents: [
    UserDocReqItemDocsItemsSupplementalDocsItems.new(
      example_image: 'string',
      status: 'NOT_PROVIDED',
      type: 'UNDEFINED',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  metadata: [
    UserDocReqItemDocsItemsMetadataItems.new(
      data_type: 'string',
      field_type: 'string',
      name: 'string',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  status: 'NOT_PROVIDED',
  type: 'UNDEFINED',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

