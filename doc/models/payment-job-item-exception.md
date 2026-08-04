
# Payment Job Item Exception

A validation or processing exception for a [Payment Job](page:resources/payment-jobs) row — captures the error code, field, and message for a payment that could not be processed. Returned alongside successful rows so the caller can fix and resubmit just the failures.

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobItemException`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Optional | The field that caused the exception |
| `phase` | `String` | Optional | The phase in which the exception occurred |
| `message` | `String` | Optional | Human-readable description of the exception |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_item_exception = PaymentJobItemException.new(
  field: 'AMOUNT',
  phase: 'DATA_VALIDATION',
  message: 'Amount must be greater than zero',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

