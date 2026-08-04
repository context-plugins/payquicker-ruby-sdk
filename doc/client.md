
# Client Class Documentation

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| api_version | `String` | Date-based API Version specified in the header *required* on all calls.<br>*Default*: `'2026.02.01'` |
| sandbox_instance | `SandboxInstance` | *Default*: `SandboxInstance::SANDBOX` |
| uat_instance | `UatInstance` | *Default*: `UatInstance::UAT1` |
| environment | [`Environment`](../README.md#environments) | The API environment. <br> **Default: `Environment.SANDBOX`** |
| connection | `Faraday::Connection` | The Faraday connection object passed by the SDK user for making requests |
| adapter | `Faraday::Adapter` | The Faraday adapter object passed by the SDK user for performing http requests |
| timeout | `Float` | The value to use for connection timeout. <br> **Default: 30** |
| max_retries | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| retry_interval | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| backoff_factor | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 2** |
| retry_statuses | `Array` | A list of HTTP statuses to retry. <br> **Default: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524, 408, 413, 429, 500, 502, 503, 504, 521, 522, 524]** |
| retry_methods | `Array` | A list of HTTP methods to retry. <br> **Default: %i[get put get put]** |
| http_callback | `HttpCallBack` | The Http CallBack allows defining callables for pre and post API calls. |
| proxy_settings | [`ProxySettings`](../doc/proxy-settings.md) | Optional proxy configuration to route HTTP requests through a proxy server. |
| logging_configuration | [`LoggingConfiguration`](../doc/logging-configuration.md) | The SDK logging configuration for API calls |
| server_credentials | [`ServerCredentials`](auth/oauth-2-client-credentials-grant.md) | The credential object for OAuth 2 Client Credentials Grant |
| clientside_credentials | [`ClientsideCredentials`](auth/oauth-2-bearer-token.md) | The credential object for OAuth 2 Bearer token |

The API client can be initialized as follows:

## Code-Based Client Initialization

```ruby
require 'pq_api_v2'
include PqApiV2

client = Client.new(
  api_version: '2026.02.01',
  server_credentials: ServerCredentials.new(
    oauth_client_id: 'OAuthClientId',
    oauth_client_secret: 'OAuthClientSecret',
    oauth_scopes: [
      OauthScopeServer::READONLY,
      OauthScopeServer::MODIFY
    ]
  ),
  clientside_credentials: ClientsideCredentials.new(
    access_token: 'AccessToken'
  ),
  environment: Environment::SANDBOX,
  sandbox_instance: SandboxInstance::SANDBOX,
  uat_instance: UatInstance::UAT1,
  logging_configuration: LoggingConfiguration.new(
    log_level: Logger::INFO,
    request_logging_config: RequestLoggingConfiguration.new(
      log_body: true
    ),
    response_logging_config: ResponseLoggingConfiguration.new(
      log_headers: true
    )
  )
)
```

## Environment-Based Client Initialization

```ruby
require 'pq_api_v2'
include PqApiV2

# Create client from environment
client = Client.from_env
```

See the [`Environment-Based Client Initialization`](../doc/environment-based-client-initialization.md) section for details.

## PQ API v2 Client

The gateway for the SDK. This class acts as a factory for the Apis and also holds the configuration of the SDK.

## Apis

| Name | Description |
|  --- | --- |
| accounts | Gets AccountsApi |
| agreements | Gets AgreementsApi |
| balances | Gets BalancesApi |
| compliance | Gets ComplianceApi |
| documents | Gets DocumentsApi |
| user_events | Gets UserEventsApi |
| transfers | Gets TransfersApi |
| prepaid_cards | Gets PrepaidCardsApi |
| programs | Gets ProgramsApi |
| receipts | Gets ReceiptsApi |
| statements | Gets StatementsApi |
| users | Gets UsersApi |
| webhooks_subscriptions | Gets WebhooksSubscriptionsApi |
| jobs | Gets JobsApi |
| authorizations | Gets AuthorizationsApi |
| instruments | Gets InstrumentsApi |
| invitations | Gets InvitationsApi |
| sensitive_card_operations | Gets SensitiveCardOperationsApi |
| oauth_authorization | Gets OauthAuthorizationApi |

