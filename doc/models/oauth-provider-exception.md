
# Oauth Provider Exception

OAuth 2 Authorization endpoint exception.

*This model accepts additional fields of type Object.*

## Structure

`OauthProviderException`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `error` | [`OauthProviderError`](../../doc/models/oauth-provider-error.md) | Required | Gets or sets error code. |
| `error_description` | `String` | Optional | Gets or sets human-readable text providing additional information on error.<br>Used to assist the client developer in understanding the error that occurred. |
| `error_uri` | `String` | Optional | Gets or sets a URI identifying a human-readable web page with information about the error, used to provide the client developer with additional information about the error. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
begin
  # make the API call
rescue OauthProviderException => e
  puts "Caught OauthProviderException: #{e.message}"
end
```

