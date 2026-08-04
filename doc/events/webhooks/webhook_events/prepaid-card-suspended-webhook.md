
# Prepaid Card Suspended Webhook

Card status changed to suspended. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [PrepaidCardSuspendedWebhookRequest](../../../../doc/models/prepaid-card-suspended-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "dest-8a3e8d5c-f799-4b41-9f05-11bbd4b552bb",
    "programUserId": "PQAPI-be274f843384f544c5ae0463a7fd87bc",
    "cardNetwork": "MASTERCARD",
    "cardNumber": "554717******7287",
    "cardPackage": "db157bea-2930-4096-9a5b-e7f662734d64",
    "country": "US",
    "createdAt": "2026-05-02T23:06:26.0000000Z",
    "currency": "USD",
    "cvv": "***",
    "expires": "05/2029",
    "status": "PENDING_ACTIVATION",
    "bankInDetails": [
      {
        "key": "BANK_ACH_ABA",
        "value": "021000021",
        "exampleAdditionalProperty": {
          "key1": "val1",
          "key2": "val2"
        }
      },
      {
        "key": "BANK_ACH_ACCOUNT_NUMBER",
        "value": "1234567890",
        "exampleAdditionalProperty": {
          "key1": "val1",
          "key2": "val2"
        }
      }
    ],
    "capabilities": [
      "BANK_IN",
      "SET_PIN",
      "APPLEPAY",
      "GOOGLEPAY",
      "SAMSUNGPAY"
    ],
    "userToken": "user-e3874103-10bd-44cf-ab5b-1b311d57cb94",
    "exampleAdditionalProperty": {
      "key1": "val1",
      "key2": "val2"
    }
  },
  "timestamp": "2026-02-07T22:23:10Z",
  "meta": {
    "meta": {
      "timezone": "UTC",
      "language": "en-US",
      "requestRef": "20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh",
      "version": "2026.02.01"
    },
    "exampleAdditionalProperty": {
      "key1": "val1",
      "key2": "val2"
    }
  },
  "exampleAdditionalProperty": {
    "key1": "val1",
    "key2": "val2"
  }
}
```

## SDK Usage Example

```ruby
# Implementation example of handling the `PrepaidCardSuspendedWebhook` event (with signature verification) in Rails.

require 'rails'
require 'action_controller/railtie'
require 'pq_api_v2'

include PqApiV2

# Define route
Rails.application.routes.draw do
  post '/webhooks/receive', to: 'webhooks#receive'
end

# Define controller
class WebhooksController < ActionController::API
  def receive
    # Step 1: Create the handler using your shared secret key.
    handler = WebhookEventsHandler.new('your-shared-secret')

    # Step 2: Verify and parse the request into a typed event.
    # Use the Rails request directly (Rack::Request compatible).
    event = handler.verify_and_parse_event(request)

    # Step 3: Pattern match on the event types and handle it.
    if event.is_a?(PrepaidCardSuspendedWebhookRequest) && event.event_type == 'PREPAIDCARDS.UPDATED.STATUS.SUSPENDED'
      puts 'PrepaidCardSuspendedWebhook received'
      # TODO: Add prepaidcardsuspendedwebhook handling
    elsif event.is_a?(SignatureVerificationFailure)
      puts 'Signature verification failure received'
      # TODO: Add signature verification failure handling
    elsif event.is_a?(UnknownEvent)
      puts 'Unknown event received'
      # TODO: Add unknown event handling
    else
      puts 'default received'
      # TODO: Add default handling
    end

    # Step 4: Return 200 OK to acknowledge receipt.
    head :ok
  end
end
```

## Accepted Server Responses

The server should responds with one of the following status codes:

| Status Code |
|  --- |
| 200 |

