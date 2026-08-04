
# Payment Quote Voided Webhook

A payment quote has been voided. See [Payments — Webhook Events](page:webhook-events/webhookevents-payments) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [PaymentQuoteVoidedWebhookRequest](../../../../doc/models/payment-quote-voided-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae",
    "portalId": "FOCL1BEC8SCDNJ2ZK",
    "amount": "2.00",
    "formattedAmount": "$2.00 USD",
    "acceptanceMode": "MANUAL_ACCEPT",
    "clientPaymentRef": "e53e963f051f4aa588a7515f13c82f3a",
    "createdAt": "2026-05-02T23:03:50.0000000Z",
    "currency": "USD",
    "destinationToken": "user-a2b8de56-c273-4ec0-8ede-0f677237812b",
    "programUserId": "PQAPI-a6f83b0f903fc540ee1cb41ed137983c",
    "email": "dyn1bec8scdnj2zk__alberta7@payquicker.testinator.com",
    "purpose": "BONUS",
    "sourceToken": "acct-89469bb7-daa0-4a30-8739-65e3490b3272",
    "quoteStatus": "PENDING_ACCEPTANCE",
    "transferType": "PAYMENT",
    "memo": "Q2 performance bonus",
    "note": "Reissued after retracted payment",
    "receiptStatus": "COMPLETE",
    "receiptToken": "rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f",
    "notBefore": "2026-05-03T00:00:00.0000000Z",
    "notAfter": "2026-06-03T00:00:00.0000000Z",
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
# Implementation example of handling the `PaymentQuoteVoidedWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(PaymentQuoteVoidedWebhookRequest) && event.event_type == 'PAYMENTQUOTES.VOIDED'
      puts 'PaymentQuoteVoidedWebhook received'
      # TODO: Add paymentquotevoidedwebhook handling
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

