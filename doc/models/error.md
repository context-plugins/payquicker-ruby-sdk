
# Error

Error details

*This model accepts additional fields of type Object.*

## Structure

`Error`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `code` | `String` | Optional | Error code |
| `message` | `String` | Optional | Error message |
| `details` | [`Array[Detail]`](../../doc/models/detail.md) | Optional | Detailed error information |
| `timestamp` | `String` | Optional | Timestamp of when the error occurred. |
| `path` | `String` | Optional | The API path where the error occurred. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
error = Error.new(
  code: 'INVALID_FIELD',
  message: 'The request contains validation errors.',
  details: [
    Detail.new(
      code: 'code8',
      message: 'message0',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    Detail.new(
      code: 'code8',
      message: 'message0',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    Detail.new(
      code: 'code8',
      message: 'message0',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  timestamp: '2026-02-07T22:23:09Z',
  path: '/api/v2/users',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

