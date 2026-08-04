
# User Doc Req Item Docs Items Supplemental Docs Items

A supplemental document item within a document requirement — typically a secondary form (e.g., proof of address) accompanying a primary government ID. See [Documents](page:resources/documents) and [KYC Enums](page:additional-api-information/kyc-enums).

*This model accepts additional fields of type Object.*

## Structure

`UserDocReqItemDocsItemsSupplementalDocsItems`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `example_image` | `String` | Optional | Full path of the URI used for this object |
| `status` | `String` | Optional | Review status of a [Document](page:resources/documents) submitted for KYC or business verification — values progress from `NOT_PROVIDED` → `PROVIDED` → `UNDER_REVIEW` → `APPROVED` or `REJECTED`. See [Document Status Types](page:additional-api-information/document-status-types) for the full list and meaning of each value. |
| `type` | `String` | Optional | Kind of [document](page:resources/documents) being uploaded — for example, government ID, proof of address, business registration. Required document types vary by user country and scenario; discover them via `POST /documents/requirements/search`. See [KYC Enums](page:additional-api-information/kyc-enums) for the full value list. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_doc_req_item_docs_items_supplemental_docs_items = UserDocReqItemDocsItemsSupplementalDocsItems.new(
  example_image: 'string',
  status: 'NOT_PROVIDED',
  type: 'UNDEFINED',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

