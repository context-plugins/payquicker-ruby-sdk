
# Spendback Refund Cancelled Webhook

A spendback refund quote has been cancelled. See [Spendback Refunds — Webhook Events](page:webhook-events/webhookevents-spendback-refunds) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [SpendbackRefundCancelledWebhookRequest](../../../../doc/models/spendback-refund-cancelled-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "rfnd-8975eb51-1baf-4549-a1d3-93f4f03d9c96",
    "portalId": "FOCL1BEC8SCDNJ32B",
    "amount": "2.00",
    "formattedAmount": "$2.00 USD",
    "acceptanceMode": "MANUAL_ACCEPT",
    "clientRefundRef": "f2dfcbc1369d44268888b6590756a79a",
    "createdAt": "2026-05-02T23:05:48.0000000Z",
    "currency": "USD",
    "memo": "Customer return — restocking",
    "note": "Funds returned to payee wallet",
    "sourceToken": "acct-89469bb7-daa0-4a30-8739-65e3490b3272",
    "destinationToken": "user-9051a6a6-1c86-4666-8f93-79251ce7039d",
    "spendbackPortalId": "FOCL1BEC8SCDNJ32A",
    "spendbackToken": "spnd-ae020490-edc1-4f96-b584-f989685a08bc",
    "clientSpendbackRef": "ac7d1dd70ac04100b59546f31863b139",
    "programUserId": "PQAPI-72e774e1dc536d06b3499797eccae2aa",
    "email": "dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com",
    "quoteStatus": "PENDING_ACCEPTANCE",
    "receiptStatus": "COMPLETE",
    "receiptToken": "rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f",
    "transferType": "REFUND",
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
# Implementation example of handling the `SpendbackRefundCancelledWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(SpendbackRefundCancelledWebhookRequest) && event.event_type == 'SPENDBACKREFUNDQUOTES.CANCELLED'
      puts 'SpendbackRefundCancelledWebhook received'
      # TODO: Add spendbackrefundcancelledwebhook handling
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

