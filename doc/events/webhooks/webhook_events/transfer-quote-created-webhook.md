
# Transfer Quote Created Webhook

A new transfer quote has been created. See [Transfers — Webhook Events](page:webhook-events/webhookevents-transfers) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [TransferQuoteCreatedWebhookRequest](../../../../doc/models/transfer-quote-created-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021",
    "portalId": "FOCL1BEC8SCDNJ2ZM",
    "clientTransferRef": "c23a4e8c-7f0f-47ea-b833-fc985e01051d",
    "createdAt": "2026-05-02T23:03:34.0000000Z",
    "deliveryDetails": {
      "expectedDelivery": "SAME_DAY",
      "minimumDeliveryMinutes": 4,
      "maximumDeliveryMinutes": 152,
      "expectedDeliveryTime": "2016-03-13T12:52:32.123Z",
      "exampleAdditionalProperty": {
        "key1": "val1",
        "key2": "val2"
      }
    },
    "amount": "-0.01",
    "formattedAmount": "($0.01) USD",
    "acceptanceMode": "MANUAL_ACCEPT",
    "currency": "USD",
    "destinationToken": "user-d18a0948-292e-45cd-94f6-7bb885f62842",
    "fee": {
      "category": "COMPANY",
      "distribution": [],
      "source": "TRANSACTION",
      "totalAmount": "0.00",
      "transactionAmount": "0.00",
      "type": "BANK_TRANSFER",
      "valueAmount": "0.00",
      "valueType": "PERCENTAGE",
      "exampleAdditionalProperty": {
        "key1": "val1",
        "key2": "val2"
      }
    },
    "fxRate": {
      "destinationAmount": "-0.01",
      "destinationCurrency": "USD",
      "destinationFormattedAmount": "($0.01) USD",
      "rate": "1.00",
      "sourceAmount": "-0.01",
      "sourceCurrency": "USD",
      "sourceFormattedAmount": "($0.01) USD",
      "exampleAdditionalProperty": {
        "key1": "val1",
        "key2": "val2"
      }
    },
    "memo": "Q1 incentive transfer",
    "note": "Reissued after retraction",
    "sourceToken": "acct-89469bb7-daa0-4a30-8739-65e3490b3272",
    "programUserId": "PQAPI-01866a624144f0e5f05e18de0c72d8a9",
    "email": "dyn1bec8scdnj2z4__neva_block@payquicker.testinator.com",
    "quoteStatus": "ACCEPTED",
    "receiptStatus": "COMPLETE",
    "receiptToken": "rcpt-0838989a-7a5c-4e87-8466-ed1a7d31d9c0",
    "lockside": "SOURCE",
    "method": "ACCOUNT_TO_ACCOUNT_TRANSFER",
    "transferType": "TRANSFER",
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
# Implementation example of handling the `TransferQuoteCreatedWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(TransferQuoteCreatedWebhookRequest) && event.event_type == 'TRANSFERQUOTES.CREATED'
      puts 'TransferQuoteCreatedWebhook received'
      # TODO: Add transferquotecreatedwebhook handling
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

