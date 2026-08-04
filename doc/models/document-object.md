
# Document Object

A KYC or business-verification [Document](page:resources/documents) submitted by a user, returned with HATEOAS navigation links and the current review status. See [Document Status Types](page:additional-api-information/document-status-types) for the lifecycle and [KYC Enums](page:additional-api-information/kyc-enums) for the document-type catalog.

*This model accepts additional fields of type Object.*

## Structure

`DocumentObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `fields` | [`Array[DocumentDetails]`](../../doc/models/document-details.md) | Required | Array of document fields and values<br><br>**Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `filename` | `String` | Required | The name given to a computer file in order to distinguish it from other files |
| `mime_type` | `String` | Required | A label used to identify a type of data.  Acts like a file extension on the internet. |
| `token` | `String` | Required | Document token — prefix `docu-`. See [Tokens](page:concepts/working-with-tokens).<br><br>**Default**: `'docu-2053aaad-c1a5-45e2-a2da-f71287f32800'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^docu-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
document_object = DocumentObject.new(
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:02:21.0000000Z'),
  fields: [
    DocumentDetails.new(
      key: 'TYPE',
      value: 'DRIVERS_LICENSE',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    DocumentDetails.new(
      key: 'STATUS',
      value: 'PROVIDED',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  filename: 'gateway-test-document.jpg',
  mime_type: 'image/jpeg',
  token: 'docu-e6b52ef8-8410-4d02-b21d-85c590b24cf6',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/documents/docu-e6b52ef8-8410-4d02-b21d-85c590b24cf6',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

