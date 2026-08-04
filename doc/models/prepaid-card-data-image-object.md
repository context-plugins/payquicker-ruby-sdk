
# Prepaid Card Data Image Object

`PrepaidCardDataImageBase` returned with HATEOAS navigation links — the form returned by [Sensitive Card Operations](page:resources/sensitive-card-operations) image redemption.

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardDataImageObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `image` | `String` | Required | Base64-encoded image of the prepaid card (front or back, depending on the request) |
| `side` | `String` | Required | Specifies which side of the prepaid card image to retrieve (front or back) |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `format` | [`Format1`](../../doc/models/format-1.md) | Required | Data format indicator |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_data_image_object = PrepaidCardDataImageObject.new(
  image: '<BASE_64_IMAGE>',
  side: 'FRONT',
  source_token: 'dest-80ab2a58-3dbd-4052-96e3-04a00ab29886',
  format: Format1::IMAGE,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/prepaid-cards/dest-80ab2a58-3dbd-4052-96e3-04a00ab29886/show',
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

