
# Api Error Result Exception

*This model accepts additional fields of type Object.*

## Structure

`ApiErrorResultException`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `status_code` | `Integer` | Required | HTTP status code of the error response. |
| `error` | [`Error`](../../doc/models/error.md) | Required | Error details |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
begin
  # make the API call
rescue ApiErrorResultException => e
  puts "Caught ApiErrorResultException: #{e.message}"
end
```

