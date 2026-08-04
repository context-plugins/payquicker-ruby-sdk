
# Get Card Pin Request

Request object for retrieving prepaid card PIN using an operation token

*This model accepts additional fields of type Object.*

## Structure

`GetCardPinRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `operation_token` | `String` | Required | Single-use token issued by the platform and redeemed directly by the cardholder's browser to set or reveal the prepaid-card PIN. Part of the two-step Sensitive Card Operations flow that keeps your servers out of PCI scope. See [Sensitive Card Operations](page:resources/sensitive-card-operations). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
get_card_pin_request = GetCardPinRequest.new(
  operation_token: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

