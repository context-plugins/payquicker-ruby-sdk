
# Show Card Request

Polymorphic request for retrieving prepaid card data. Discriminated by the `format` property. Use `TEXT` to retrieve card number, CVV, expiry, and cardholder name. Use `IMAGE` to retrieve a card image (front or back).

## Data Type

`ShowCardText | ShowCardImage`

## Cases

| Type |
|  --- |
| [`ShowCardText`](../../../doc/models/show-card-text.md) |
| [`ShowCardImage`](../../../doc/models/show-card-image.md) |

## ShowCardText

### Initialization Code

#### Example

```ruby
value = ShowCardText.new(
  operation_token: 'iEureKuLW1gZQ7d3/2ijX4+6bDZuUwpp2QmhPfedarncS2Cde1Ebmby+dxfeP7+Iaty9YYCLFwY42HHOm03dliH7Jp0Yo/sjOb/FmSQ3IOVYpNSYBcZYGmgpyBEG9gPa2HRIKK8+NcPVjjb+0gfqFAI52Emk0P+VPaBZ2NgsENV/I4MuIkWsUXha3QZh49a0EK3wO14jwR4BosY/rk0/9F5uJEWUjv8gvPej+dCFyMnybjj6jPK9f/gFlPUYVHuS',
  format: Format2::TEXT
)
```

## ShowCardImage

### Initialization Code

#### Example

```ruby
value = ShowCardImage.new(
  operation_token: 'iEureKuLW1gZQ7d3/2ijX4+6bDZuUwpp2QmhPfedarncS2Cde1Ebmby+dxfeP7+Iaty9YYCLFwY42HHOm03dliH7Jp0Yo/sjOb/FmSQ3IOVYpNSYBcZYGmgpyBEG9gPa2HRIKK8+NcPVjjb+0gfqFAI52Emk0P+VPaBZ2NgsENV/I4MuIkWsUXha3QZh49a0EK3wO14jwR4BosY/rk0/9F5uJEWUjv8gvPej+dCFyMnybjj6jPK9f/gFlPUYVHuS',
  format: Format3::IMAGE,
  side: 'FRONT'
)
```

