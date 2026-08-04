
# Spendback Accepted Webhook

A spendback quote has been accepted. See [Spendbacks — Webhook Events](page:webhook-events/webhookevents-spendbacks) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [SpendbackAcceptedWebhookRequest](../../../../doc/models/spendback-accepted-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "spnd-8985daf7-6854-4593-a00a-8b93b9d247e8",
    "portalId": "FOCL1BEC8SCDNJ2YW",
    "amount": "0.50",
    "formattedAmount": "$0.50 USD",
    "clientSpendbackRef": "f48e4b082063492bb6e7d35408d98f83",
    "acceptanceMode": "AUTO_ACCEPT",
    "createdAt": "2026-05-02T23:01:40.0000000Z",
    "currency": "USD",
    "destinationToken": "acct-89469bb7-daa0-4a30-8739-65e3490b3272",
    "fee": {
      "category": "COMPANY",
      "distribution": [],
      "source": "TRANSACTION",
      "totalAmount": "0.50",
      "transactionAmount": "0.50",
      "type": "SPENDBACK_PROCESSING_FEE",
      "valueAmount": "0.00",
      "valueType": "PERCENTAGE",
      "exampleAdditionalProperty": {
        "key1": "val1",
        "key2": "val2"
      }
    },
    "memo": "Order",
    "note": "Customer purchased company merchandise",
    "sourceToken": "user-9051a6a6-1c86-4666-8f93-79251ce7039d",
    "programUserId": "PQAPI-72e774e1dc536d06b3499797eccae2aa",
    "email": "dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com",
    "quoteStatus": "ACCEPTED",
    "receiptStatus": "COMPLETE",
    "receiptToken": "rcpt-401e7533-b973-4da6-baae-e336e540da2a",
    "remainingBalance": "0.00",
    "transferType": "SPENDBACK",
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
# Implementation example of handling the `SpendbackAcceptedWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(SpendbackAcceptedWebhookRequest) && event.event_type == 'SPENDBACKQUOTES.ACCEPTED'
      puts 'SpendbackAcceptedWebhook received'
      # TODO: Add spendbackacceptedwebhook handling
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

