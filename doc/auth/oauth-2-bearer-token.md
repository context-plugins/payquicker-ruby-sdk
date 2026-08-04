
# OAuth 2 Bearer token



Documentation for accessing and setting credentials for clientside.

## Auth Credentials

| Name | Type | Description | Getter |
|  --- | --- | --- | --- |
| AccessToken | `String` | The OAuth 2.0 Access Token to use for API requests. | `access_token` |



**Note:** Auth credentials can be set using `ClientsideCredentials` object, passed in as named parameter `clientside_credentials` in the client initialization.

## Usage Example

### Client Initialization

You must provide credentials in the client as shown in the following code snippet.

```ruby
require 'pq_api_v2'
include PqApiV2

client = Client.new(
  clientside_credentials: ClientsideCredentials.new(
    access_token: 'AccessToken'
  )
)
```


