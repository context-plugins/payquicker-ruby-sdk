
# Prepaid Card Data Text Base

Prepaid-card data returned in text form: PAN, CVV, expiry, and cardholder name. See [Sensitive Card Operations](page:resources/sensitive-card-operations) for the redemption flow that keeps your servers outside PCI scope.

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardDataTextBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `pan` | `String` | Required | Unique number on the prepaid card |
| `cvv` | `String` | Required | Three- or four-digit Card Verification Value (CVV) number displayed on the back of a credit or debit card |
| `exp` | `String` | Required | Date that the card will expire |
| `name` | `String` | Required | Name of the card's owner |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `format` | [`Format`](../../doc/models/format.md) | Required | Data format indicator |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_data_text_base = PrepaidCardDataTextBase.new(
  pan: '5547170284487212',
  cvv: '615',
  exp: '05/29',
  name: 'JOYCE RIPPIN',
  source_token: 'dest-80ab2a58-3dbd-4052-96e3-04a00ab29886',
  format: Format::TEXT,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

