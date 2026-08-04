
# Prepaid Card Pin Base

Prepaid-card PIN payload returned as part of a PIN reveal flow. See [Sensitive Card Operations](page:resources/sensitive-card-operations) for the redemption pattern that keeps PIN material out of your application.

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardPinBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `pin` | `String` | Required | Card PIN, used for ATM withdrawals and PIN-debit transactions. |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_pin_base = PrepaidCardPinBase.new(
  pin: 'string',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

