
# User Kyc Required Webhook

User KYC documentation is required. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [UserKycRequiredWebhookRequest](../../../../doc/models/user-kyc-required-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "user-19543ac9-83f9-4ef2-9964-71063789d0e1",
    "createdAt": "2026-05-02T22:59:08.0000000Z",
    "status": "ACTIVE",
    "programToken": "prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5",
    "programUserId": "PQAPI-be274f843384f544c5ae0463a7fd87bc",
    "email": "edd_glover44@payquicker.testinator.com",
    "firstName": "Edd",
    "lastName": "Glover",
    "dateOfBirth": "2000-05-03",
    "userType": "INDIVIDUAL",
    "language": "en-US",
    "addresses": [
      {
        "addressType": "RESIDENTIAL",
        "addressLine1": "2083 Crona Walks",
        "addressLine2": "Suite 443",
        "addressLine3": "Deangelomouth VA  51456",
        "city": "Deangelomouth",
        "region": "VA",
        "postalCode": "51456",
        "country": "US"
      },
      {
        "addressType": "MAILING",
        "addressLine1": "9307 Kris Haven",
        "addressLine2": "Suite 010",
        "city": "New Darrion",
        "region": "SC",
        "postalCode": "65707",
        "country": "US"
      }
    ],
    "phoneNumbers": [
      {
        "number": "+15852282715",
        "country": "US",
        "numberType": "PRIMARY"
      },
      {
        "number": "+15852282715",
        "country": "US",
        "numberType": "MOBILE"
      }
    ],
    "gender": "NOT_SPECIFIED",
    "countryOfBirth": "US",
    "countryOfNationality": "US",
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
# Implementation example of handling the `UserKycRequiredWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(UserKycRequiredWebhookRequest) && event.event_type == 'USERS.UPDATED.KYC.REQUIRED'
      puts 'UserKycRequiredWebhook received'
      # TODO: Add userkycrequiredwebhook handling
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

