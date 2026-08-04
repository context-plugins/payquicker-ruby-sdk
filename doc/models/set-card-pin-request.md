
# Set Card Pin Request

Request object for updating prepaid card PIN

*This model accepts additional fields of type Object.*

## Structure

`SetCardPinRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `operation_token` | `String` | Required | Single-use token issued by the platform and redeemed directly by the cardholder's browser to set or reveal the prepaid-card PIN. Part of the two-step Sensitive Card Operations flow that keeps your servers out of PCI scope. See [Sensitive Card Operations](page:resources/sensitive-card-operations). |
| `pin` | `String` | Required | Card PIN, used for ATM withdrawals and PIN-debit transactions. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
set_card_pin_request = SetCardPinRequest.new(
  operation_token: 'string',
  pin: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

