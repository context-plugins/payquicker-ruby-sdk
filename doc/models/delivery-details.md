
# Delivery Details

The delivery details of a Bank transfer with the minimum and maximum delivery in minutes or the expected delivery time.

*This model accepts additional fields of type Object.*

## Structure

`DeliveryDetails`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `minimum_delivery_minutes` | `Integer` | Optional | Minimum delivery time in minutes for the bank transfer |
| `maximum_delivery_minutes` | `Integer` | Optional | Maximum delivery time in minutes for the bank transfer |
| `expected_delivery` | `String` | Optional | Expected delivery window for a [Transfer](page:resources/transfers) — `SAME_DAY` (funds arrive on the same business day) or `NEXT_BANKING_DAY` (funds arrive the next business day). Returned on transfer quotes so the payer can choose between delivery speed and cost. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the rails that drive each delivery window. |
| `expected_delivery_time` | `DateTime` | Optional | The time of the expected delivery. Does not include the date. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
delivery_details = DeliveryDetails.new(
  minimum_delivery_minutes: 4320,
  maximum_delivery_minutes: 10080,
  expected_delivery: 'SAME_DAY',
  expected_delivery_time: DateTimeHelper.from_rfc3339('0001-01-01T21:00:00Z'),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

