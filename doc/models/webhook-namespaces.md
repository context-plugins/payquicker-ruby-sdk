
# Webhook Namespaces

Namespaced event identifier on a webhook delivery — encodes the resource and lifecycle action in a single dotted token (e.g., `BANKACCOUNTS.CREATED`, `PAYMENTS.UPDATED.STATUS.COMPLETE`, `USERS.UPDATED.STATUS.REGISTRATIONCOMPLETE`). Client handlers route on this value to dispatch to per-event business logic. See the [Webhooks](page:concepts/available-webhooks) catalog for the full per-program-type matrix and [Event Notifications](page:concepts/working-with-event-notifications) for retry / idempotency semantics.

## Enumeration

`WebhookNamespaces`

## Fields

| Name | Description |
|  --- | --- |
| `BANKACCOUNTS_CREATED` | Webhook event triggered when a new bank account is created |
| `BANKACCOUNTS_UPDATED_DETAILS_MODIFIED` | Webhook event triggered when bank account details are modified |
| `BANKACCOUNTS_UPDATED_STATUS_APPROVED` | Webhook event triggered when a bank account status changes to approved |
| `BANKACCOUNTS_UPDATED_STATUS_COMPLIANCEHOLD` | Webhook event triggered when a bank account is placed on compliance hold |
| `BANKACCOUNTS_UPDATED_STATUS_DELETED` | Webhook event triggered when a bank account is deleted |
| `INVITATIONJOBS_CANCELLED` | Webhook event triggered when a batch invitation job is cancelled |
| `INVITATIONJOBS_COMPLETED` | Webhook event triggered when a batch invitation job completes |
| `INVITATIONJOBS_CREATED` | Webhook event triggered when a new batch invitation job is created |
| `INVITATIONJOBS_FAILED` | Webhook event triggered when a batch invitation job fails |
| `INVITATIONJOBS_UPDATED` | Webhook event triggered when a batch invitation job is updated |
| `PAYMENTJOBS_CANCELLED` | Webhook event triggered when a batch payment job is cancelled |
| `PAYMENTJOBS_COMPLETED` | Webhook event triggered when a batch payment job completes |
| `PAYMENTJOBS_CREATED` | Webhook event triggered when a new batch payment job is created |
| `PAYMENTJOBS_FAILED` | Webhook event triggered when a batch payment job fails |
| `PAYMENTJOBS_UPDATED` | Webhook event triggered when a batch payment job is updated |
| `ELECTRONICWALLETS_CREATED` | Webhook event triggered when a new electronic wallet is created |
| `ELECTRONICWALLETS_UPDATED_DETAILS_MODIFIED` | Webhook event triggered when electronic wallet details are modified |
| `ELECTRONICWALLETS_UPDATED_STATUS_APPROVED` | Webhook event triggered when an electronic wallet status changes to approved |
| `ELECTRONICWALLETS_UPDATED_STATUS_COMPLIANCEHOLD` | Webhook event triggered when an electronic wallet is placed on compliance hold |
| `ELECTRONICWALLETS_UPDATED_STATUS_DELETED` | Webhook event triggered when an electronic wallet is deleted |
| `INVITATIONS_CANCELLED` | Webhook event triggered when an invitation is cancelled |
| `INVITATIONS_CREATED` | Webhook event triggered when a new invitation is created |
| `INVITATIONS_USED` | Webhook event triggered when an invitation is used by the payee |
| `PAYMENTQUOTES_ACCEPTED` | Webhook event triggered when a payment quote is accepted |
| `PAYMENTQUOTES_CANCELLED` | Webhook event triggered when a payment quote is cancelled |
| `PAYMENTQUOTES_CREATED` | Webhook event triggered when a new payment quote is created |
| `PAYMENTQUOTES_VOIDED` | Webhook event triggered when a payment quote is voided |
| `PAYMENTRETRACTIONQUOTES_ACCEPTED` | Webhook event triggered when a payment retraction quote is accepted |
| `PAYMENTRETRACTIONQUOTES_CANCELLED` | Webhook event triggered when a payment retraction quote is cancelled |
| `PAYMENTRETRACTIONQUOTES_CREATED` | Webhook event triggered when a new payment retraction quote is created |
| `PAYMENTRETRACTIONQUOTES_VOIDED` | Webhook event triggered when a payment retraction quote is voided |
| `PREPAIDCARDS_CREATED` | Webhook event triggered when a new prepaid card is created |
| `PREPAIDCARDS_UPDATED_STATUS_ACTIVE` | Webhook event triggered when a prepaid card status changes to active |
| `PREPAIDCARDS_UPDATED_STATUS_CLOSED` | Webhook event triggered when a prepaid card is closed |
| `PREPAIDCARDS_UPDATED_STATUS_CLOSEDEXPIRED` | Webhook event triggered when a prepaid card is closed due to expiration |
| `PREPAIDCARDS_UPDATED_STATUS_CLOSEDFRAUD` | Webhook event triggered when a prepaid card is closed due to fraud |
| `PREPAIDCARDS_UPDATED_STATUS_CLOSEDLOST` | Webhook event triggered when a prepaid card is closed because it was lost |
| `PREPAIDCARDS_UPDATED_STATUS_CLOSEDSTOLEN` | Webhook event triggered when a prepaid card is closed because it was stolen |
| `PREPAIDCARDS_UPDATED_STATUS_COMPLIANCEHOLD` | Webhook event triggered when a prepaid card is placed on compliance hold |
| `PREPAIDCARDS_UPDATED_STATUS_PENDINGACTIVATION` | Webhook event triggered when a prepaid card status changes to pending activation |
| `PREPAIDCARDS_UPDATED_STATUS_PENDINGORDER` | Webhook event triggered when a prepaid card status changes to pending order |
| `PREPAIDCARDS_UPDATED_STATUS_PENDINGRELEASE` | Webhook event triggered when a prepaid card status changes to pending release |
| `PREPAIDCARDS_UPDATED_STATUS_SUSPENDED` | Webhook event triggered when a prepaid card is suspended |
| `RECEIPTS_CREATED` | Webhook event triggered when a new receipt is created |
| `RECEIPTS_UPDATED_DETAILS_MODIFIED` | Webhook event triggered when receipt details are modified |
| `RECEIPTS_UPDATED_STATUS_CANCELLED` | Webhook event triggered when a receipt status changes to cancelled |
| `RECEIPTS_UPDATED_STATUS_COMPLETED` | Webhook event triggered when a receipt is completed |
| `RECEIPTS_UPDATED_STATUS_FAILED` | Webhook event triggered when a receipt fails |
| `RECEIPTS_UPDATED_STATUS_PENDING` | Webhook event triggered when a receipt status changes to pending |
| `RECEIPTS_UPDATED_STATUS_PROCESSING` | Webhook event triggered when a receipt is being processed |
| `RECEIPTS_UPDATED_STATUS_REFUNDED` | Webhook event triggered when a receipt is refunded |
| `RECEIPTS_UPDATED_STATUS_RETURNED` | Webhook event triggered when a receipt is returned |
| `RECEIPTS_UPDATED_STATUS_REVERSED` | Webhook event triggered when a receipt is reversed |
| `RECEIPTS_UPDATED_STATUS_SCHEDULED` | Webhook event triggered when a receipt is scheduled |
| `SPENDBACKQUOTES_ACCEPTED` | Webhook event triggered when a spendback quote is accepted |
| `SPENDBACKQUOTES_CANCELLED` | Webhook event triggered when a spendback quote is cancelled |
| `SPENDBACKQUOTES_CREATED` | Webhook event triggered when a new spendback quote is created |
| `SPENDBACKQUOTES_VOIDED` | Webhook event triggered when a spendback quote is voided |
| `SPENDBACKREFUNDQUOTES_ACCEPTED` | Webhook event triggered when a spendback refund quote is accepted |
| `SPENDBACKREFUNDQUOTES_CANCELLED` | Webhook event triggered when a spendback refund quote is cancelled |
| `SPENDBACKREFUNDQUOTES_CREATED` | Webhook event triggered when a new spendback refund quote is created |
| `SPENDBACKREFUNDQUOTES_VOIDED` | Webhook event triggered when a spendback refund quote is voided |
| `TRANSFERQUOTES_ACCEPTED` | Webhook event triggered when a transfer quote is accepted |
| `TRANSFERQUOTES_CANCELLED` | Webhook event triggered when a transfer quote is cancelled |
| `TRANSFERQUOTES_CREATED` | Webhook event triggered when a new transfer quote is created |
| `TRANSFERQUOTES_VOIDED` | Webhook event triggered when a transfer quote is voided |
| `USEREVENTS_CANCELLED` | Webhook event triggered when a user event is cancelled |
| `USEREVENTS_COMPLETED` | Webhook event triggered when a user event is completed |
| `USEREVENTS_STARTED` | Webhook event triggered when a user event starts |
| `USEREVENTS_UPDATED` | Webhook event triggered when a user event is updated |
| `USERS_CREATED` | Webhook event triggered when a new user is created |
| `USERS_UPDATED_IDV_FAILED` | Webhook event triggered when user identity verification fails |
| `USERS_UPDATED_IDV_PASSED` | Webhook event triggered when user identity verification passes |
| `USERS_UPDATED_KYC_APPROVED` | Webhook event triggered when user KYC is approved |
| `USERS_UPDATED_KYC_PROVIDED` | Webhook event triggered when user KYC documentation is provided |
| `USERS_UPDATED_KYC_REJECTED` | Webhook event triggered when user KYC is rejected |
| `USERS_UPDATED_KYC_REQUIRED` | Webhook event triggered when user KYC is required |
| `USERS_UPDATED_DETAILS` | Webhook event triggered when user details are updated |
| `USERS_UPDATED_STATUS_REGISTRATIONCOMPLETE` | Webhook event triggered when user registration is complete |
| `USERS_UPDATED_STATUS_REGISTRATIONINPROGRESS` | Webhook event triggered when user registration is in progress |

## Example

```ruby
webhook_namespaces = WebhookNamespaces::RECEIPTS_UPDATED_DETAILS_MODIFIED
```

