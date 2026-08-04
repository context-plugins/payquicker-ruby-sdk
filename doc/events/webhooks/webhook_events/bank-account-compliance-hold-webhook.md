
# Bank Account Compliance Hold Webhook

Bank account placed on compliance hold. See [Bank Accounts — Webhook Events](page:webhook-events/webhookevents-bank-accounts) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [BankAccountComplianceHoldWebhookRequest](../../../../doc/models/bank-account-compliance-hold-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "dest-d1242f80-d94d-40ad-8cbb-568af10c45fb",
    "instrumentType": "BANK",
    "purpose": "PERSONAL",
    "country": "US",
    "currency": "USD",
    "createdAt": "2026-05-02T22:56:03.0000000Z",
    "description": "Primary personal checking account",
    "fields": [
      {
        "key": "BANK_BBAN",
        "value": "****4234",
        "exampleAdditionalProperty": {
          "key1": "val1",
          "key2": "val2"
        }
      },
      {
        "key": "BANK_ACH_ABA",
        "value": "****1863",
        "exampleAdditionalProperty": {
          "key1": "val1",
          "key2": "val2"
        }
      },
      {
        "key": "BENEFICIARY_NAME",
        "value": "Maybelle Volkman",
        "exampleAdditionalProperty": {
          "key1": "val1",
          "key2": "val2"
        }
      },
      {
        "key": "BANK_NAME",
        "value": "Central City Bank",
        "exampleAdditionalProperty": {
          "key1": "val1",
          "key2": "val2"
        }
      }
    ],
    "status": "VERIFIED",
    "type": "CHECKING",
    "method": "US_SAMEDAY_IACH",
    "address": null,
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
# Implementation example of handling the `BankAccountComplianceHoldWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(BankAccountComplianceHoldWebhookRequest) && event.event_type == 'BANKACCOUNTS.UPDATED.STATUS.COMPLIANCEHOLD'
      puts 'BankAccountComplianceHoldWebhook received'
      # TODO: Add bankaccountcomplianceholdwebhook handling
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

