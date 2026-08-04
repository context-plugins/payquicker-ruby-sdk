
# Receipt Cancelled Webhook

Receipt status changed to cancelled. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [ReceiptCancelledWebhookRequest](../../../../doc/models/receipt-cancelled-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f",
    "type": "PAYMENT_RETRACTION",
    "createdAt": "2026-05-02T23:04:37.0000000Z",
    "sign": "DEBIT",
    "sourceToken": "user-9051a6a6-1c86-4666-8f93-79251ce7039d",
    "destinationToken": "acct-89469bb7-daa0-4a30-8739-65e3490b3272",
    "programUserId": "PQAPI-72e774e1dc536d06b3499797eccae2aa",
    "email": "alberta.purdy@payquicker.testinator.com",
    "portalId": "FOCL1BEC8SCDNJ31J",
    "amount": "-2.00",
    "formattedAmount": "($2.00) USD",
    "currency": "USD",
    "status": "COMPLETE",
    "description": "Retraction for FOCL1BEC8SCDNJ31G",
    "deliveryDetails": {
      "expectedDelivery": "SAME_DAY",
      "expectedDeliveryTime": "0001-01-01T21:00:00Z",
      "minimumDeliveryMinutes": 4,
      "maximumDeliveryMinutes": 152,
      "exampleAdditionalProperty": {
        "key1": "val1",
        "key2": "val2"
      }
    },
    "details": {
      "bankAccountId": "021000021",
      "bankAccountIdType": "BANK_ACH_ABA",
      "bankName": "JPMorgan Chase Bank",
      "bankId": "021000021",
      "bankIdType": "BANK_ACH_ABA",
      "beneficaryName": "Alberta Purdy",
      "memo": "Retraction for original payment",
      "note": "Retraction Initiated By Company",
      "correlationToken": "pmnt-7d631de0-3467-4ece-b408-29dc748ed615",
      "processorReference": "c3c600111b62426797e8596bd1dcaa5f",
      "exampleAdditionalProperty": {
        "key1": "val1",
        "key2": "val2"
      }
    },
    "fxRate": {
      "destinationAmount": "-2.00",
      "destinationCurrency": "USD",
      "destinationFormattedAmount": "($2.00) USD",
      "rate": "1.00",
      "sourceAmount": "-2.00",
      "sourceCurrency": "USD",
      "sourceFormattedAmount": "($2.00) USD"
    },
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
# Implementation example of handling the `ReceiptCancelledWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(ReceiptCancelledWebhookRequest) && event.event_type == 'RECEIPTS.UPDATED.STATUS.CANCELLED'
      puts 'ReceiptCancelledWebhook received'
      # TODO: Add receiptcancelledwebhook handling
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

