
# Navigation Link

The properties of a navigation link.

*This model accepts additional fields of type Object.*

## Structure

`NavigationLink`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `href` | `String` | Required | - |
| `method` | `String` | Optional | - |
| `title` | `String` | Optional | - |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
navigation_link = NavigationLink.new(
  href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
  method: 'POST',
  title: 'Accept Quote',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

