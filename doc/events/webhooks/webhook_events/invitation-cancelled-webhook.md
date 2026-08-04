
# Invitation Cancelled Webhook

An invitation has been cancelled. See [Invitations — Webhook Events](page:webhook-events/webhookevents-invitations) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [InvitationCancelledWebhookRequest](../../../../doc/models/invitation-cancelled-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "invt-7f09b8e6-59d3-4c53-8a6f-8cdb1403b97d",
    "programToken": "prog-15945a09-4e81-e758-ef04-c774fc30efc8",
    "key": "<INVITATION_KEY>",
    "url": "https://tenant.mypayquicker.build/Welcome?invitationId=<INVITATION_KEY>",
    "status": "PENDING",
    "registrationStatus": "NOT_STARTED",
    "currency": "USD",
    "createdAt": "2026-03-25T12:03:09.0000000Z",
    "programUserId": "00f1537c-963e-4b9a-98ce-c496255002d5",
    "email": "marcel74@payquicker.testinator.com",
    "userToken": "user-18773ac9-83f9-4ef2-9964-71063789cad3",
    "notifyUser": false,
    "issueCard": false,
    "firstName": "Marcel",
    "lastName": "Glover",
    "language": "en-US",
    "userType": "INDIVIDUAL",
    "dateOfBirth": "1985-04-15",
    "addresses": [
      {
        "addressType": "RESIDENTIAL",
        "addressLine1": "2083 Crona Walks",
        "addressLine2": "Suite 443",
        "city": "Deangelomouth",
        "region": "VA",
        "postalCode": "51456",
        "country": "US"
      }
    ],
    "phoneNumbers": [
      {
        "number": "+15852282715",
        "country": "US",
        "numberType": "MOBILE"
      }
    ],
    "primaryUserToken": "user-19543ac9-83f9-4ef2-9964-71063789d0e1",
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
# Implementation example of handling the `InvitationCancelledWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(InvitationCancelledWebhookRequest) && event.event_type == 'INVITATIONS.CANCELLED'
      puts 'InvitationCancelledWebhook received'
      # TODO: Add invitationcancelledwebhook handling
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

