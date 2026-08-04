
# Detail

*This model accepts additional fields of type Object.*

## Structure

`Detail`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `code` | `String` | Optional | Detailed error code |
| `message` | `String` | Optional | Detailed error message |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
detail = Detail.new(
  code: 'FIELD_REQUIRED',
  message: 'The \'email\' field is required.',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

