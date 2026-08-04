
# Payment Retraction Cancelled Webhook

A payment retraction quote has been cancelled. See [Payment Retractions — Webhook Events](page:webhook-events/webhookevents-payment-retractions) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [PaymentRetractionCancelledWebhookRequest](../../../../doc/models/payment-retraction-cancelled-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50",
    "portalId": "FOCL1BEC8SCDNJ307",
    "amount": "2.00",
    "formattedAmount": "$2.00 USD",
    "acceptanceMode": "MANUAL_ACCEPT",
    "allowPartial": false,
    "clientRetractionRef": "c0f8bdcaf7c647d0be2ecf9e1d646cc8",
    "createdAt": "2026-05-02T23:04:09.0000000Z",
    "currency": "USD",
    "memo": "Customer charge dispute",
    "note": "Funds reversed to source account",
    "sourceToken": "user-9051a6a6-1c86-4666-8f93-79251ce7039d",
    "destinationToken": "acct-89469bb7-daa0-4a30-8739-65e3490b3272",
    "paymentRetractionPortalId": "FOCL1BEC8SCDNJ306",
    "paymentToken": "pmnt-240b953b-6276-4a1b-b982-61122bde3638",
    "clientPaymentRef": "c125739e6fbb471987b474fa3527dcb5",
    "programUserId": "PQAPI-72e774e1dc536d06b3499797eccae2aa",
    "email": "dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com",
    "quoteStatus": "PENDING_ACCEPTANCE",
    "receiptStatus": "COMPLETE",
    "receiptToken": "rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f",
    "transferType": "RETRACTION",
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
# Implementation example of handling the `PaymentRetractionCancelledWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(PaymentRetractionCancelledWebhookRequest) && event.event_type == 'PAYMENTRETRACTIONQUOTES.CANCELLED'
      puts 'PaymentRetractionCancelledWebhook received'
      # TODO: Add paymentretractioncancelledwebhook handling
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

