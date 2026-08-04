
# Portal Payment Job

A batch payment job for a Hosted Portal program — one or more [Payments](page:resources/transfers) submitted as a single CSV-driven request, with each row processed independently. Counterpart to `GatewayPaymentJob` for Gateway programs. See [Payment Jobs](page:resources/payment-jobs).

*This model accepts additional fields of type Object.*

## Structure

`PortalPaymentJob`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `not_before` | `DateTime` | Optional | Transfer is scheduled and will not process before this time. ISO 8601 format. |
| `not_after` | `DateTime` | Optional | Transfer expires if not accepted prior to this time. ISO 8601 format. |
| `items` | [`Array[PortalPaymentJobQuote]`](../../doc/models/portal-payment-job-quote.md) | Required | Array of payment items in the job |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
portal_payment_job = PortalPaymentJob.new(
  items: [
    PortalPaymentJobQuote.new(
      source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'john.doe@email.com',
      amount: '11.02',
      client_payment_ref: 'd4b6f130-1d1c-4ce2-903a-0c1ad128f55e',
      transfer_type: TransferType::PAYMENT,
      note: 'string',
      memo: 'string',
      purpose: 'BONUS',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  not_before: DateTimeHelper.from_rfc3339('2022-04-26T15:16:18Z'),
  not_after: DateTimeHelper.from_rfc3339('2019-08-24T14:15:22Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

