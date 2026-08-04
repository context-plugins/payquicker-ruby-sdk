
# Error Base

Error response containing error details and tracking information

*This model accepts additional fields of type Object.*

## Structure

`ErrorBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `status_code` | `Integer` | Required | HTTP status code of the error response. |
| `error` | [`Error`](../../doc/models/error.md) | Required | Error details |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
error_base = ErrorBase.new(
  status_code: 400,
  error: Error.new(
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
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

