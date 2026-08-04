## Webhook Events Handler

Place holder for now

Events in this group are uniquely identified by the `eventType` field.

## Signature Verification

This handler uses the `HMAC Signature Verifier` for request verification. Each event in this group includes an `X-Signature` header that will be validated using your shared `secret-key` to ensure request authenticity.

## Events

Events available in this group. Subscribe to receive webhook notifications when these events occur.

| Name | Description | Event Identifier |
|  --- | --- | --- |
| [BankAccountCreatedWebhook](../../../doc/events/webhooks/webhook_events/bank-account-created-webhook.md) | A new bank account has been created. See [Bank Accounts — Webhook Events](page:webhook-events/webhookevents-bank-accounts) for details. | BANKACCOUNTS.CREATED |
| [BankAccountApprovedWebhook](../../../doc/events/webhooks/webhook_events/bank-account-approved-webhook.md) | Bank account status changed to approved. See [Bank Accounts — Webhook Events](page:webhook-events/webhookevents-bank-accounts) for details. | BANKACCOUNTS.UPDATED.STATUS.APPROVED |
| [BankAccountDeletedWebhook](../../../doc/events/webhooks/webhook_events/bank-account-deleted-webhook.md) | Bank account status changed to deleted. See [Bank Accounts — Webhook Events](page:webhook-events/webhookevents-bank-accounts) for details. | BANKACCOUNTS.UPDATED.STATUS.DELETED |
| [BankAccountComplianceHoldWebhook](../../../doc/events/webhooks/webhook_events/bank-account-compliance-hold-webhook.md) | Bank account placed on compliance hold. See [Bank Accounts — Webhook Events](page:webhook-events/webhookevents-bank-accounts) for details. | BANKACCOUNTS.UPDATED.STATUS.COMPLIANCEHOLD |
| [BankAccountModifiedWebhook](../../../doc/events/webhooks/webhook_events/bank-account-modified-webhook.md) | Bank account details have been modified. See [Bank Accounts — Webhook Events](page:webhook-events/webhookevents-bank-accounts) for details. | BANKACCOUNTS.UPDATED.DETAILS.MODIFIED |
| [InvitationJobCreatedWebhook](../../../doc/events/webhooks/webhook_events/invitation-job-created-webhook.md) | A new batch invitation job has been created. See [Batch Invitations — Webhook Events](page:webhook-events/webhookevents-batch-invitations) for details. | INVITATIONJOBS.CREATED |
| [InvitationJobUpdatedWebhook](../../../doc/events/webhooks/webhook_events/invitation-job-updated-webhook.md) | A batch invitation job has been updated. See [Batch Invitations — Webhook Events](page:webhook-events/webhookevents-batch-invitations) for details. | INVITATIONJOBS.UPDATED |
| [InvitationJobCompletedWebhook](../../../doc/events/webhooks/webhook_events/invitation-job-completed-webhook.md) | A batch invitation job has completed. See [Batch Invitations — Webhook Events](page:webhook-events/webhookevents-batch-invitations) for details. | INVITATIONJOBS.COMPLETED |
| [InvitationJobFailedWebhook](../../../doc/events/webhooks/webhook_events/invitation-job-failed-webhook.md) | A batch invitation job has failed. See [Batch Invitations — Webhook Events](page:webhook-events/webhookevents-batch-invitations) for details. | INVITATIONJOBS.FAILED |
| [InvitationJobCancelledWebhook](../../../doc/events/webhooks/webhook_events/invitation-job-cancelled-webhook.md) | A batch invitation job has been cancelled. See [Batch Invitations — Webhook Events](page:webhook-events/webhookevents-batch-invitations) for details. | INVITATIONJOBS.CANCELLED |
| [PaymentJobCreatedWebhook](../../../doc/events/webhooks/webhook_events/payment-job-created-webhook.md) | A new batch payment job has been created. See [Batch Payments — Webhook Events](page:webhook-events/webhookevents-batch-payments) for details. | PAYMENTJOBS.CREATED |
| [PaymentJobUpdatedWebhook](../../../doc/events/webhooks/webhook_events/payment-job-updated-webhook.md) | A batch payment job has been updated. See [Batch Payments — Webhook Events](page:webhook-events/webhookevents-batch-payments) for details. | PAYMENTJOBS.UPDATED |
| [PaymentJobCompletedWebhook](../../../doc/events/webhooks/webhook_events/payment-job-completed-webhook.md) | A batch payment job has completed. See [Batch Payments — Webhook Events](page:webhook-events/webhookevents-batch-payments) for details. | PAYMENTJOBS.COMPLETED |
| [PaymentJobFailedWebhook](../../../doc/events/webhooks/webhook_events/payment-job-failed-webhook.md) | A batch payment job has failed. See [Batch Payments — Webhook Events](page:webhook-events/webhookevents-batch-payments) for details. | PAYMENTJOBS.FAILED |
| [PaymentJobCancelledWebhook](../../../doc/events/webhooks/webhook_events/payment-job-cancelled-webhook.md) | A batch payment job has been cancelled. See [Batch Payments — Webhook Events](page:webhook-events/webhookevents-batch-payments) for details. | PAYMENTJOBS.CANCELLED |
| [EwalletCreatedWebhook](../../../doc/events/webhooks/webhook_events/ewallet-created-webhook.md) | An electronic wallet has been created. See [Electronic Wallets — Webhook Events](page:webhook-events/webhookevents-electronic-wallets) for details. | ELECTRONICWALLETS.CREATED |
| [EwalletApprovedWebhook](../../../doc/events/webhooks/webhook_events/ewallet-approved-webhook.md) | Ewallet status changed to approved. See [Electronic Wallets — Webhook Events](page:webhook-events/webhookevents-electronic-wallets) for details. | ELECTRONICWALLETS.UPDATED.STATUS.APPROVED |
| [EwalletDeletedWebhook](../../../doc/events/webhooks/webhook_events/ewallet-deleted-webhook.md) | Ewallet status changed to deleted. See [Electronic Wallets — Webhook Events](page:webhook-events/webhookevents-electronic-wallets) for details. | ELECTRONICWALLETS.UPDATED.STATUS.DELETED |
| [EwalletComplianceHoldWebhook](../../../doc/events/webhooks/webhook_events/ewallet-compliance-hold-webhook.md) | Ewallet placed on compliance hold. See [Electronic Wallets — Webhook Events](page:webhook-events/webhookevents-electronic-wallets) for details. | ELECTRONICWALLETS.UPDATED.STATUS.COMPLIANCEHOLD |
| [EwalletModifiedWebhook](../../../doc/events/webhooks/webhook_events/ewallet-modified-webhook.md) | Ewallet details have been modified. See [Electronic Wallets — Webhook Events](page:webhook-events/webhookevents-electronic-wallets) for details. | ELECTRONICWALLETS.UPDATED.DETAILS.MODIFIED |
| [InvitationCreatedWebhook](../../../doc/events/webhooks/webhook_events/invitation-created-webhook.md) | A new invitation has been created. See [Invitations — Webhook Events](page:webhook-events/webhookevents-invitations) for details. | INVITATIONS.CREATED |
| [InvitationCancelledWebhook](../../../doc/events/webhooks/webhook_events/invitation-cancelled-webhook.md) | An invitation has been cancelled. See [Invitations — Webhook Events](page:webhook-events/webhookevents-invitations) for details. | INVITATIONS.CANCELLED |
| [InvitationUsedWebhook](../../../doc/events/webhooks/webhook_events/invitation-used-webhook.md) | An invitation has been used by the payee. See [Invitations — Webhook Events](page:webhook-events/webhookevents-invitations) for details. | INVITATIONS.USED |
| [PaymentQuoteCreatedWebhook](../../../doc/events/webhooks/webhook_events/payment-quote-created-webhook.md) | A new payment quote has been created. See [Payments — Webhook Events](page:webhook-events/webhookevents-payments) for details. | PAYMENTQUOTES.CREATED |
| [PaymentQuoteAcceptedWebhook](../../../doc/events/webhooks/webhook_events/payment-quote-accepted-webhook.md) | A payment quote has been accepted. See [Payments — Webhook Events](page:webhook-events/webhookevents-payments) for details. | PAYMENTQUOTES.ACCEPTED |
| [PaymentQuoteVoidedWebhook](../../../doc/events/webhooks/webhook_events/payment-quote-voided-webhook.md) | A payment quote has been voided. See [Payments — Webhook Events](page:webhook-events/webhookevents-payments) for details. | PAYMENTQUOTES.VOIDED |
| [PaymentQuoteCancelledWebhook](../../../doc/events/webhooks/webhook_events/payment-quote-cancelled-webhook.md) | A payment quote has been cancelled. See [Payments — Webhook Events](page:webhook-events/webhookevents-payments) for details. | PAYMENTQUOTES.CANCELLED |
| [PaymentRetractionCreatedWebhook](../../../doc/events/webhooks/webhook_events/payment-retraction-created-webhook.md) | A new payment retraction quote has been created. See [Payment Retractions — Webhook Events](page:webhook-events/webhookevents-payment-retractions) for details. | PAYMENTRETRACTIONQUOTES.CREATED |
| [PaymentRetractionAcceptedWebhook](../../../doc/events/webhooks/webhook_events/payment-retraction-accepted-webhook.md) | A payment retraction quote has been accepted. See [Payment Retractions — Webhook Events](page:webhook-events/webhookevents-payment-retractions) for details. | PAYMENTRETRACTIONQUOTES.ACCEPTED |
| [PaymentRetractionVoidedWebhook](../../../doc/events/webhooks/webhook_events/payment-retraction-voided-webhook.md) | A payment retraction quote has been voided. See [Payment Retractions — Webhook Events](page:webhook-events/webhookevents-payment-retractions) for details. | PAYMENTRETRACTIONQUOTES.VOIDED |
| [PaymentRetractionCancelledWebhook](../../../doc/events/webhooks/webhook_events/payment-retraction-cancelled-webhook.md) | A payment retraction quote has been cancelled. See [Payment Retractions — Webhook Events](page:webhook-events/webhookevents-payment-retractions) for details. | PAYMENTRETRACTIONQUOTES.CANCELLED |
| [PrepaidCardCreatedWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-created-webhook.md) | A prepaid card has been created. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.CREATED |
| [PrepaidCardPendingOrderWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-pending-order-webhook.md) | Card status changed to pending order. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.PENDINGORDER |
| [PrepaidCardPendingReleaseWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-pending-release-webhook.md) | Card status changed to pending release. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.PENDINGRELEASE |
| [PrepaidCardPendingActivationWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-pending-activation-webhook.md) | Card status changed to pending activation. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.PENDINGACTIVATION |
| [PrepaidCardActiveWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-active-webhook.md) | Card status changed to active. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.ACTIVE |
| [PrepaidCardSuspendedWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-suspended-webhook.md) | Card status changed to suspended. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.SUSPENDED |
| [PrepaidCardComplianceHoldWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-compliance-hold-webhook.md) | Card placed on compliance hold. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.COMPLIANCEHOLD |
| [PrepaidCardClosedLostWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-closed-lost-webhook.md) | Card status changed to closed (lost). See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.CLOSEDLOST |
| [PrepaidCardClosedExpiredWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-closed-expired-webhook.md) | Card status changed to closed (expired). See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.CLOSEDEXPIRED |
| [PrepaidCardClosedFraudWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-closed-fraud-webhook.md) | Card status changed to closed (fraud). See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.CLOSEDFRAUD |
| [PrepaidCardClosedStolenWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-closed-stolen-webhook.md) | Card status changed to closed (stolen). See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.CLOSEDSTOLEN |
| [PrepaidCardClosedWebhook](../../../doc/events/webhooks/webhook_events/prepaid-card-closed-webhook.md) | Card status changed to closed. See [Prepaid Cards — Webhook Events](page:webhook-events/webhookevents-prepaid-cards) for details. | PREPAIDCARDS.UPDATED.STATUS.CLOSED |
| [ReceiptCreatedWebhook](../../../doc/events/webhooks/webhook_events/receipt-created-webhook.md) | A receipt has been created. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.CREATED |
| [ReceiptPendingWebhook](../../../doc/events/webhooks/webhook_events/receipt-pending-webhook.md) | Receipt status changed to pending. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.PENDING |
| [ReceiptCompletedWebhook](../../../doc/events/webhooks/webhook_events/receipt-completed-webhook.md) | Receipt status changed to completed. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.COMPLETED |
| [ReceiptCancelledWebhook](../../../doc/events/webhooks/webhook_events/receipt-cancelled-webhook.md) | Receipt status changed to cancelled. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.CANCELLED |
| [ReceiptFailedWebhook](../../../doc/events/webhooks/webhook_events/receipt-failed-webhook.md) | Receipt status changed to failed. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.FAILED |
| [ReceiptScheduledWebhook](../../../doc/events/webhooks/webhook_events/receipt-scheduled-webhook.md) | Receipt status changed to scheduled. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.SCHEDULED |
| [ReceiptProcessingWebhook](../../../doc/events/webhooks/webhook_events/receipt-processing-webhook.md) | Receipt is being processed. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.PROCESSING |
| [ReceiptReversedWebhook](../../../doc/events/webhooks/webhook_events/receipt-reversed-webhook.md) | Receipt status changed to reversed. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.REVERSED |
| [ReceiptRefundedWebhook](../../../doc/events/webhooks/webhook_events/receipt-refunded-webhook.md) | Receipt status changed to refunded. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.REFUNDED |
| [ReceiptReturnedWebhook](../../../doc/events/webhooks/webhook_events/receipt-returned-webhook.md) | Receipt status changed to returned. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.STATUS.RETURNED |
| [ReceiptModifiedWebhook](../../../doc/events/webhooks/webhook_events/receipt-modified-webhook.md) | Receipt details have been modified. See [Receipts — Webhook Events](page:webhook-events/webhookevents-receipts) for details. | RECEIPTS.UPDATED.DETAILS.MODIFIED |
| [SpendbackCreatedWebhook](../../../doc/events/webhooks/webhook_events/spendback-created-webhook.md) | A new spendback quote has been created. See [Spendbacks — Webhook Events](page:webhook-events/webhookevents-spendbacks) for details. | SPENDBACKQUOTES.CREATED |
| [SpendbackAcceptedWebhook](../../../doc/events/webhooks/webhook_events/spendback-accepted-webhook.md) | A spendback quote has been accepted. See [Spendbacks — Webhook Events](page:webhook-events/webhookevents-spendbacks) for details. | SPENDBACKQUOTES.ACCEPTED |
| [SpendbackVoidedWebhook](../../../doc/events/webhooks/webhook_events/spendback-voided-webhook.md) | A spendback quote has been voided. See [Spendbacks — Webhook Events](page:webhook-events/webhookevents-spendbacks) for details. | SPENDBACKQUOTES.VOIDED |
| [SpendbackCancelledWebhook](../../../doc/events/webhooks/webhook_events/spendback-cancelled-webhook.md) | A spendback quote has been cancelled. See [Spendbacks — Webhook Events](page:webhook-events/webhookevents-spendbacks) for details. | SPENDBACKQUOTES.CANCELLED |
| [SpendbackRefundCreatedWebhook](../../../doc/events/webhooks/webhook_events/spendback-refund-created-webhook.md) | A new spendback refund quote has been created. See [Spendback Refunds — Webhook Events](page:webhook-events/webhookevents-spendback-refunds) for details. | SPENDBACKREFUNDQUOTES.CREATED |
| [SpendbackRefundAcceptedWebhook](../../../doc/events/webhooks/webhook_events/spendback-refund-accepted-webhook.md) | A spendback refund quote has been accepted. See [Spendback Refunds — Webhook Events](page:webhook-events/webhookevents-spendback-refunds) for details. | SPENDBACKREFUNDQUOTES.ACCEPTED |
| [SpendbackRefundVoidedWebhook](../../../doc/events/webhooks/webhook_events/spendback-refund-voided-webhook.md) | A spendback refund quote has been voided. See [Spendback Refunds — Webhook Events](page:webhook-events/webhookevents-spendback-refunds) for details. | SPENDBACKREFUNDQUOTES.VOIDED |
| [SpendbackRefundCancelledWebhook](../../../doc/events/webhooks/webhook_events/spendback-refund-cancelled-webhook.md) | A spendback refund quote has been cancelled. See [Spendback Refunds — Webhook Events](page:webhook-events/webhookevents-spendback-refunds) for details. | SPENDBACKREFUNDQUOTES.CANCELLED |
| [TransferQuoteCreatedWebhook](../../../doc/events/webhooks/webhook_events/transfer-quote-created-webhook.md) | A new transfer quote has been created. See [Transfers — Webhook Events](page:webhook-events/webhookevents-transfers) for details. | TRANSFERQUOTES.CREATED |
| [TransferQuoteAcceptedWebhook](../../../doc/events/webhooks/webhook_events/transfer-quote-accepted-webhook.md) | A transfer quote has been accepted. See [Transfers — Webhook Events](page:webhook-events/webhookevents-transfers) for details. | TRANSFERQUOTES.ACCEPTED |
| [TransferQuoteVoidedWebhook](../../../doc/events/webhooks/webhook_events/transfer-quote-voided-webhook.md) | A transfer quote has been voided. See [Transfers — Webhook Events](page:webhook-events/webhookevents-transfers) for details. | TRANSFERQUOTES.VOIDED |
| [TransferQuoteCancelledWebhook](../../../doc/events/webhooks/webhook_events/transfer-quote-cancelled-webhook.md) | A transfer quote has been cancelled. See [Transfers — Webhook Events](page:webhook-events/webhookevents-transfers) for details. | TRANSFERQUOTES.CANCELLED |
| [UserEventStartedWebhook](../../../doc/events/webhooks/webhook_events/user-event-started-webhook.md) | A user event has started. See [User Events — Webhook Events](page:webhook-events/webhookevents-user-events) for details. | USEREVENTS.STARTED |
| [UserEventUpdatedWebhook](../../../doc/events/webhooks/webhook_events/user-event-updated-webhook.md) | A user event has been updated. See [User Events — Webhook Events](page:webhook-events/webhookevents-user-events) for details. | USEREVENTS.UPDATED |
| [UserEventCompletedWebhook](../../../doc/events/webhooks/webhook_events/user-event-completed-webhook.md) | A user event has been completed. See [User Events — Webhook Events](page:webhook-events/webhookevents-user-events) for details. | USEREVENTS.COMPLETED |
| [UserEventCancelledWebhook](../../../doc/events/webhooks/webhook_events/user-event-cancelled-webhook.md) | A user event has been cancelled. See [User Events — Webhook Events](page:webhook-events/webhookevents-user-events) for details. | USEREVENTS.CANCELLED |
| [UserCreatedWebhook](../../../doc/events/webhooks/webhook_events/user-created-webhook.md) | A new user has been created. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.CREATED |
| [UserRegistrationInProgressWebhook](../../../doc/events/webhooks/webhook_events/user-registration-in-progress-webhook.md) | User registration is in progress. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.STATUS.REGISTRATIONINPROGRESS |
| [UserRegistrationCompleteWebhook](../../../doc/events/webhooks/webhook_events/user-registration-complete-webhook.md) | User registration is complete. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE |
| [UserKycRequiredWebhook](../../../doc/events/webhooks/webhook_events/user-kyc-required-webhook.md) | User KYC documentation is required. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.KYC.REQUIRED |
| [UserKycProvidedWebhook](../../../doc/events/webhooks/webhook_events/user-kyc-provided-webhook.md) | User KYC documentation has been provided. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.KYC.PROVIDED |
| [UserKycRejectedWebhook](../../../doc/events/webhooks/webhook_events/user-kyc-rejected-webhook.md) | User KYC has been rejected. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.KYC.REJECTED |
| [UserKycApprovedWebhook](../../../doc/events/webhooks/webhook_events/user-kyc-approved-webhook.md) | User KYC has been approved. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.KYC.APPROVED |
| [UserIdvPassedWebhook](../../../doc/events/webhooks/webhook_events/user-idv-passed-webhook.md) | User identity verification has passed. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.IDV.PASSED |
| [UserIdvFailedWebhook](../../../doc/events/webhooks/webhook_events/user-idv-failed-webhook.md) | User identity verification has failed. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.IDV.FAILED |
| [UserDetailsUpdatedWebhook](../../../doc/events/webhooks/webhook_events/user-details-updated-webhook.md) | User details have been updated. See [Users — Webhook Events](page:webhook-events/webhookevents-users) for details. | USERS.UPDATED.DETAILS |

## SDK Usage Example

```ruby
# Implementation example for handling the `Webhooks` events with Rails
# (signature verification).

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
    if event.is_a?(BankAccountCreatedWebhookRequest) && event.event_type == 'BANKACCOUNTS.CREATED'
      puts 'BankAccountCreatedWebhook received'
      # TODO: Add bankaccountcreatedwebhook handling
    elsif event.is_a?(BankAccountApprovedWebhookRequest) && event.event_type == 'BANKACCOUNTS.UPDATED.STATUS.APPROVED'
      puts 'BankAccountApprovedWebhook received'
      # TODO: Add bankaccountapprovedwebhook handling
    elsif event.is_a?(BankAccountDeletedWebhookRequest) && event.event_type == 'BANKACCOUNTS.UPDATED.STATUS.DELETED'
      puts 'BankAccountDeletedWebhook received'
      # TODO: Add bankaccountdeletedwebhook handling
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

    # Step 4: Return  OK to acknowledge receipt.
    head :ok
  end
end
```

