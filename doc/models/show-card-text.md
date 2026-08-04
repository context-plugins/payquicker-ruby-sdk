
# Show Card Text

Request to fetch prepaid card data in text format

*This model accepts additional fields of type Object.*

## Structure

`ShowCardText`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `operation_token` | `String` | Required | A token used to reveal prepaid card information in the form of image data (base64) or JSON. |
| `format` | [`Format2`](../../doc/models/format-2.md) | Required | Must be TEXT to retrieve card data as text fields |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
show_card_text = ShowCardText.new(
  operation_token: 'iEureKuLW1gZQ7d3/2ijX4+6bDZuUwpp2QmhPfedarncS2Cde1Ebmby+dxfeP7+Iaty9YYCLFwY42HHOm03dliH7Jp0Yo/sjOb/FmSQ3IOVYpNSYBcZYGmgpyBEG9gPa2HRIKK8+NcPVjjb+0gfqFAI52Emk0P+VPaBZ2NgsENV/I4MuIkWsUXha3QZh49a0EK3wO14jwR4BosY/rk0/9F5uJEWUjv8gvPej+dCFyMnybjj6jPK9f/gFlPUYVHuS',
  format: Format2::TEXT,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

