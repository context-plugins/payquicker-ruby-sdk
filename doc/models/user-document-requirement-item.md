
# User Document Requirement Item

A single (country × document-type) entry returned by `POST /documents/requirements/search` — describes which documents a user from a given country must supply for KYC. See [Documents](page:resources/documents) and [KYC Enums](page:additional-api-information/kyc-enums).

*This model accepts additional fields of type Object.*

## Structure

`UserDocumentRequirementItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `country_of_birth` | `String` | Optional | Country where the user was born |
| `country_of_nationality` | `String` | Optional | Country of the user's nationality |
| `documents` | [`Array[UserDocumentRequirementItemDocumentsItems]`](../../doc/models/user-document-requirement-item-documents-items.md) | Optional | Array of document items required for verification |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_document_requirement_item = UserDocumentRequirementItem.new(
  country_of_birth: 'string',
  country_of_nationality: 'string',
  documents: [
    UserDocumentRequirementItemDocumentsItems.new(
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
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

