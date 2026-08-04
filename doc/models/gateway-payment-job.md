
# Gateway Payment Job

A batch payment job for a Gateway program — one or more [Payments](page:resources/transfers) submitted as a single CSV-driven request, with each row processed independently. Counterpart to `PortalPaymentJob` for Hosted Portal programs. See [Payment Jobs](page:resources/payment-jobs).

*This model accepts additional fields of type Object.*

## Structure

`GatewayPaymentJob`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `not_before` | `DateTime` | Optional | Transfer is scheduled and will not process before this time. ISO 8601 format. |
| `not_after` | `DateTime` | Optional | Transfer expires if not accepted prior to this time. ISO 8601 format. |
| `items` | [`Array[GatewayPaymentJobQuote]`](../../doc/models/gateway-payment-job-quote.md) | Required | - |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
gateway_payment_job = GatewayPaymentJob.new(
  items: [
    GatewayPaymentJobQuote.new(
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
      amount: '150.00',
      client_payment_ref: 'ref-001',
      transfer_type: TransferType::PAYMENT,
      note: 'note6',
      memo: 'Q2 incentive bonus',
      purpose: 'BONUS',
      additional_properties: {
        'acceptanceMode' => JSON.parse('"AUTO_ACCEPT"')
      }
    ),
    GatewayPaymentJobQuote.new(
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
      amount: '75.00',
      client_payment_ref: 'ref-002',
      transfer_type: TransferType::PAYMENT,
      note: 'note6',
      memo: 'Q2 incentive bonus',
      purpose: 'BONUS',
      additional_properties: {
        'acceptanceMode' => JSON.parse('"AUTO_ACCEPT"')
      }
    )
  ],
  not_before: DateTimeHelper.from_rfc3339('2026-05-10T00:00:00Z'),
  not_after: DateTimeHelper.from_rfc3339('2016-03-13T12:52:32.123Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

