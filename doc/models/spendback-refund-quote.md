
# Spendback Refund Quote

Request object for creating a spendback refund quote

*This model accepts additional fields of type Object.*

## Structure

`SpendbackRefundQuote`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `spendback_id` | `String` | Required | Unique value provided by the client for the transfer, utilized for reference and deduplication.<br><br>**Constraints**: *Maximum Length*: `50` |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `amount` | `String` | Required | Money to be refunded from original payment, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision)) |
| `client_refund_ref` | `String` | Required | Unique value provided by the client for the transfer, utilized for reference and deduplication.<br><br>**Constraints**: *Maximum Length*: `50` |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `acceptance_mode` | `String` | Required | How a transfer quote is processed after creation — required on every transfer quote body. `AUTO_ACCEPT` causes the quote to be accepted and executed in a single call — a fire-and-forget disbursement. `MANUAL_ACCEPT` leaves the quote in `PENDING_ACCEPTANCE` and requires an explicit `POST /transfers/{token}/accept` to execute it. See [Transfers](page:resources/transfers) for the quote / accept lifecycle. |
| `transfer_type` | [`TransferType10`](../../doc/models/transfer-type-10.md) | Required | Discriminator value identifying this as a spendback refund quote. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
spendback_refund_quote = SpendbackRefundQuote.new(
  spendback_id: 'string',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  amount: '1.23',
  client_refund_ref: 'string',
  acceptance_mode: 'AUTO_ACCEPT',
  transfer_type: TransferType10::REFUND,
  memo: 'string',
  note: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

