
# Invitation Job Cancelled Webhook

A batch invitation job has been cancelled. See [Batch Invitations — Webhook Events](page:webhook-events/webhookevents-batch-invitations) for details.

## Signature Verification

This event uses the `HMAC Signature Verifier` for request verification. The event includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Headers

This event's request contains the following headers.

| Name |
|  --- |
| Content-Type |

## Payload Type

This event's request payload is of type [InvitationJobCancelledWebhookRequest](../../../../doc/models/invitation-job-cancelled-webhook-request.md).

## Payload Example

```json
{
  "eventType": "BANKACCOUNTS.CREATED",
  "payload": {
    "token": "jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c",
    "portalId": "ARCL1B6I34CMVKLC0",
    "filename": "API_7fc1a31f-74fe-424d-845f-b60392dfc79c.txt",
    "createdAt": "2026-02-07T22:23:09Z",
    "totalCount": 1,
    "validCount": 1,
    "invalidCount": 0,
    "type": "INVITATIONS",
    "status": "COMPLETED",
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
# Implementation example of handling the `InvitationJobCancelledWebhook` event (with signature verification) in Rails.

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
    if event.is_a?(InvitationJobCancelledWebhookRequest) && event.event_type == 'INVITATIONJOBS.CANCELLED'
      puts 'InvitationJobCancelledWebhook received'
      # TODO: Add invitationjobcancelledwebhook handling
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

