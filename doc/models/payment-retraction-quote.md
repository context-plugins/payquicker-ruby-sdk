
# Payment Retraction Quote

Quote for retracting a payment. Retractions do not take an amount because they always attempt to recover the full balance of the original payment. If insufficient funds are available, a partial retraction is performed and subsequent retraction attempts can recover remaining amounts as balance becomes available. Does not vary by program type — the payment being retracted is identified by the path parameter.

*This model accepts additional fields of type Object.*

## Structure

`PaymentRetractionQuote`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payment_id` | `String` | Required | Unique value provided by the client for the transfer, utilized for reference and deduplication.<br><br>**Constraints**: *Maximum Length*: `50` |
| `client_retraction_ref` | `String` | Required | Unique value provided by the client for the payment retraction<br><br>**Constraints**: *Maximum Length*: `50` |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `acceptance_mode` | `String` | Required | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `transfer_type` | [`TransferType5`](../../doc/models/transfer-type-5.md) | Required | Discriminator value identifying this as a payment retraction quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_retraction_quote = PaymentRetractionQuote.new(
  payment_id: 'pmnt-240b953b-6276-4a1b-b982-61122bde3638',
  client_retraction_ref: 'cec0bb44f7f14d8b9ebffaf8e7329b99',
  acceptance_mode: 'MANUAL_ACCEPT',
  transfer_type: TransferType5::RETRACTION,
  memo: 'cancel retraction test',
  note: 'note0',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

