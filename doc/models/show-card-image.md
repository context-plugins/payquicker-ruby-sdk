
# Show Card Image

Request to fetch prepaid card data as an image

*This model accepts additional fields of type Object.*

## Structure

`ShowCardImage`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `operation_token` | `String` | Required | A token used to reveal prepaid card information in the form of image data (base64) or JSON. |
| `format` | [`Format3`](../../doc/models/format-3.md) | Required | Must be IMAGE to retrieve card data as an image |
| `side` | `String` | Required | Specifies which side of the prepaid card image to retrieve (front or back) |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
show_card_image = ShowCardImage.new(
  operation_token: 'iEureKuLW1gZQ7d3/2ijX4+6bDZuUwpp2QmhPfedarncS2Cde1Ebmby+dxfeP7+Iaty9YYCLFwY42HHOm03dliH7Jp0Yo/sjOb/FmSQ3IOVYpNSYBcZYGmgpyBEG9gPa2HRIKK8+NcPVjjb+0gfqFAI52Emk0P+VPaBZ2NgsENV/I4MuIkWsUXha3QZh49a0EK3wO14jwR4BosY/rk0/9F5uJEWUjv8gvPej+dCFyMnybjj6jPK9f/gFlPUYVHuS',
  format: Format3::IMAGE,
  side: 'FRONT',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

