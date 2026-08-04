
# Getting Started with PQ API v2

## Introduction

PayQuicker offers a secure and instant payout platform that delivers payment to a payee-owned and insured bank account linked to a debit card, similar to a standard checking account.

As soon as the payment is made, funds are available in the insured account and available to spend instantly online through a virtual card, at retail with a plastic prepaid debit card, or by loading the card to a mobile wallet.

PayQuicker provides a RESTful API that allows authorized clients to send and receive payments, debit user's accounts for spendback, retrieve user account balance, retrieve user reports, and retrieve transaction reports.

## Building

The generated code depends on a few Ruby gems. The references to these gems are added in the gemspec file. The easiest way to resolve the dependencies, build the gem and install it is through Rake:

1. Install Rake if not already installed: `gem install rake`
2. Install Bundler if not already installed: `gem install bundler`
3. From terminal/cmd navigate to the root directory of the SDK.
4. Invoke: `rake install`

Alternatively, you can build and install the gem manually:

1. From terminal/cmd navigate to the root directory of the SDK.
2. Run the build command: `gem build pq_api_v2.gemspec`
3. Run the install command: `gem install pq_api_v2-2026.2.1.gem`

![Installing Gem](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&gemVer=2026.2.1&gemName=pq_api_v2&step=buildSDK)

## Installation

The following section explains how to use the pq_api_v2 ruby gem in a new Rails project using RubyMine&trade;. The basic workflow presented here is also applicable if you prefer using a different editor or IDE.

### 1. Starting a new project

Close any existing projects in RubyMine&trade; by selecting `File -> Close Project`. Next, click on `Create New Project` to create a new project from scratch.

![Create a new project in RubyMine - Step 1](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&step=createNewProject0)

Next, provide `TestApp` as the project name, choose `Rails Application` as the project type, and click `OK`.

![Create a new Rails Application in RubyMine - Step 2](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&step=createNewProject1)

In the next dialog make sure that the correct Ruby SDK is being used (>= 2.6 and <= 3.2) and click `OK`.

![Create a new Rails Application in RubyMine - Step 3](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&step=createNewProject2)

### 2. Add reference of the gem

In order to use the `pq_api_v2` gem in the new project we must add a gem reference. Locate the `Gemfile` in the Project Explorer window under the `TestApp` project node. The file contains references to all gems being used in the project. Here, add the reference to the library gem by adding the following line: `gem 'pq_api_v2', '2026.2.1'`

![Add new reference to the Gemfile](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&gemVer=2026.2.1&gemName=pq_api_v2&step=addReference)

### 3. Adding a new Rails Controller

Once the `TestApp` project is created, a folder named `controllers` will be visible in the *Project Explorer* under the following path: `TestApp > app > controllers`. Right click on this folder and select `New -> Run Rails Generator...`.

![Run Rails Generator on Controllers Folder](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&gemVer=2026.2.1&gemName=pq_api_v2&step=addCode0)

Selecting the said option will popup a small window where the generator names are displayed. Here, select the `controller` template.

![Create a new Controller](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&step=addCode1)

Next, a popup window will ask you for a Controller name and included Actions. For controller name provide `Hello` and include an action named `Index` and click `OK`.

![Add a new Controller](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&gemVer=2026.2.1&gemName=pq_api_v2&step=addCode2)

A new controller class named `HelloController` will be created in a file named `hello_controller.rb` containing a method named `Index`.

1. Add the `require 'pq_api_v2'` statement to require the gem in the controller file.
2. Add the `include PqApiV2` statement to include the sdk module in the controller file.
3. In the `Index` method, add code for initialization and a sample for its usage.

![Initialize the library](https://apidocs.io/illustration/ruby?workspaceFolder=PqApiV2&gemName=pq_api_v2&step=addCode3)

## IRB Console Usage

You can explore the SDK interactively using IRB in two ways

### 1. Use IRB with Installed Gem

Open your system terminal (Command Prompt, Git Bash or macOS Terminal) and type the following command to start the irb console.

```bash
irb
```

Now you can load the SDK in the IRB

```ruby
require 'pq_api_v2'
include PqApiV2
```

### 2. Use IRB within SDK

Open your system terminal (Command Prompt, Git Bash or macOS Terminal) and navigate to the root folder of SDK.

```
cd path/to/pq_api_v2
```

Now you can start the preconfigured irb console by running the following command

```bash
ruby bin/console
```

**_Note:_** This automatically loads the SDK from lib/

## Initialize the API Client

**_Note:_** Documentation for the client can be found [here.](doc/client.md)

The following parameters are configurable for the API Client:

| Parameter | Type | Description |
|  --- | --- | --- |
| api_version | `String` | Date-based API Version specified in the header *required* on all calls.<br>*Default*: `'2026.02.01'` |
| sandbox_instance | `SandboxInstance` | *Default*: `SandboxInstance::SANDBOX` |
| uat_instance | `UatInstance` | *Default*: `UatInstance::UAT1` |
| environment | [`Environment`](README.md#environments) | The API environment. <br> **Default: `Environment.SANDBOX`** |
| connection | `Faraday::Connection` | The Faraday connection object passed by the SDK user for making requests |
| adapter | `Faraday::Adapter` | The Faraday adapter object passed by the SDK user for performing http requests |
| timeout | `Float` | The value to use for connection timeout. <br> **Default: 30** |
| max_retries | `Integer` | The number of times to retry an endpoint call if it fails. <br> **Default: 0** |
| retry_interval | `Float` | Pause in seconds between retries. <br> **Default: 1** |
| backoff_factor | `Float` | The amount to multiply each successive retry's interval amount by in order to provide backoff. <br> **Default: 2** |
| retry_statuses | `Array` | A list of HTTP statuses to retry. <br> **Default: [408, 413, 429, 500, 502, 503, 504, 521, 522, 524, 408, 413, 429, 500, 502, 503, 504, 521, 522, 524]** |
| retry_methods | `Array` | A list of HTTP methods to retry. <br> **Default: %i[get put get put]** |
| http_callback | `HttpCallBack` | The Http CallBack allows defining callables for pre and post API calls. |
| proxy_settings | [`ProxySettings`](doc/proxy-settings.md) | Optional proxy configuration to route HTTP requests through a proxy server. |
| logging_configuration | [`LoggingConfiguration`](doc/logging-configuration.md) | The SDK logging configuration for API calls |
| server_credentials | [`ServerCredentials`](doc/auth/oauth-2-client-credentials-grant.md) | The credential object for OAuth 2 Client Credentials Grant |
| clientside_credentials | [`ClientsideCredentials`](doc/auth/oauth-2-bearer-token.md) | The credential object for OAuth 2 Bearer token |

The API client can be initialized as follows:

### Code-Based Client Initialization

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

### Environment-Based Client Initialization

```ruby
require 'pq_api_v2'
include PqApiV2

# Create client from environment
client = Client.from_env
```

See the [`Environment-Based Client Initialization`](doc/environment-based-client-initialization.md) section for details.

## Environments

The SDK can be configured to use a different environment for making API calls. Available environments are:

### Fields

| Name | Description |
|  --- | --- |
| PRODUCTION | Production |
| SANDBOX | **Default** Sandbox is used for both sandbox testing and customer UAT. |
| UAT | UAT is used for both sandbox testing and customer UAT. |
| DEVELOPMENT | Development is used for local development testing. |

## Authorization

This API uses the following authentication schemes.

* [`server (OAuth 2 Client Credentials Grant)`](doc/auth/oauth-2-client-credentials-grant.md)
* [`clientside (OAuth 2 Bearer token)`](doc/auth/oauth-2-bearer-token.md)

## List of APIs

* [User Events](doc/controllers/user-events.md)
* [Prepaid Cards](doc/controllers/prepaid-cards.md)
* [Webhooks Subscriptions](doc/controllers/webhooks-subscriptions.md)
* [Sensitive Card Operations](doc/controllers/sensitive-card-operations.md)
* [Accounts](doc/controllers/accounts.md)
* [Agreements](doc/controllers/agreements.md)
* [Balances](doc/controllers/balances.md)
* [Compliance](doc/controllers/compliance.md)
* [Documents](doc/controllers/documents.md)
* [Transfers](doc/controllers/transfers.md)
* [Programs](doc/controllers/programs.md)
* [Receipts](doc/controllers/receipts.md)
* [Statements](doc/controllers/statements.md)
* [Users](doc/controllers/users.md)
* [Jobs](doc/controllers/jobs.md)
* [Authorizations](doc/controllers/authorizations.md)
* [Instruments](doc/controllers/instruments.md)
* [Invitations](doc/controllers/invitations.md)

## Webhooks

* [Webhook Events](doc/events/webhooks/webhook-events-handler.md)

## SDK Infrastructure

### Configuration

* [ProxySettings](doc/proxy-settings.md)
* [Environment-Based Client Initialization](doc/environment-based-client-initialization.md)
* [AbstractLogger](doc/abstract-logger.md)
* [LoggingConfiguration](doc/logging-configuration.md)
* [RequestLoggingConfiguration](doc/request-logging-configuration.md)
* [ResponseLoggingConfiguration](doc/response-logging-configuration.md)

### HTTP

* [HttpResponse](doc/http-response.md)
* [HttpRequest](doc/http-request.md)

### Utilities

* [ApiResponse](doc/api-response.md)
* [ApiHelper](doc/api-helper.md)
* [DateTimeHelper](doc/date-time-helper.md)

