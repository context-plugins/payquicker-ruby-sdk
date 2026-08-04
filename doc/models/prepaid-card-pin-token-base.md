
# Prepaid Card Pin Token Base

A single-use server-side token issued for revealing or setting a prepaid-card PIN directly in the cardholder's browser, keeping PIN material out of your application. See [Sensitive Card Operations](page:resources/sensitive-card-operations) and [Tokens](page:additional-api-information/tokens).

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardPinTokenBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `operation_token` | `String` | Required | Single-use token issued by the platform and redeemed directly by the cardholder's browser to set or reveal the prepaid-card PIN. Part of the two-step Sensitive Card Operations flow that keeps your servers out of PCI scope. See [Sensitive Card Operations](page:resources/sensitive-card-operations). |
| `purpose` | `String` | Required | Purpose of a single-use server-side token issued via the [Sensitive Card Operations](page:resources/sensitive-card-operations) flow — `PREPAID_CARD_DATA` (display PAN / CVV / expiry to the cardholder's browser) or `PREPAID_CARD_PIN` (reveal or set the card PIN). The token is redeemed directly by the cardholder's browser against PayQuicker, keeping your servers outside of PCI scope. See [Tokens](page:concepts/working-with-tokens) for the broader identifier-token model. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_pin_token_base = PrepaidCardPinTokenBase.new(
  source_token: 'dest-ef104634-6c19-4f34-a1b1-9c92722d0c62',
  operation_token: 'Hzv4TzKfT/EK5AWRBv8z5b9BVJ/9z17ZhB/s3ei1+xn9wADtUejcv0u9LLG4FbNPONsa1KzK46s+PZw7AlsW7WlIztO6x4wd',
  purpose: 'PREPAID_CARD_PIN',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

