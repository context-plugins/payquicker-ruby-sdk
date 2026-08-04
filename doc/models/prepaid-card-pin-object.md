
# Prepaid Card Pin Object

`PrepaidCardPinBase` returned with HATEOAS navigation links — the form returned by [Sensitive Card Operations](page:resources/sensitive-card-operations) PIN redemption.

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardPinObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `pin` | `String` | Required | Card PIN, used for ATM withdrawals and PIN-debit transactions. |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_pin_object = PrepaidCardPinObject.new(
  pin: '1234',
  source_token: 'dest-80ab2a58-3dbd-4052-96e3-04a00ab29886',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/prepaid-cards/dest-80ab2a58-3dbd-4052-96e3-04a00ab29886/pin',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

