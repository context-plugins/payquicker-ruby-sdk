
# Prepaid Card Data Token Object

`PrepaidCardDataTokenBase` returned with HATEOAS navigation links — the form returned in API responses. See [Sensitive Card Operations](page:resources/sensitive-card-operations).

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardDataTokenObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `source_token` | `String` | Required | Token identifying the source of funds — typically a user-wallet token (`user-`), a company funding-account token (`acct-`), or a prepaid-card destination token (`dest-`).<br><br>**Default**: `'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'`<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|user\|dest)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `operation_token` | `String` | Required | A token used to reveal prepaid card information in the form of image data (base64) or JSON. |
| `purpose` | `String` | Required | Purpose of a single-use server-side token issued via the [Sensitive Card Operations](page:resources/sensitive-card-operations) flow — `PREPAID_CARD_DATA` (display PAN / CVV / expiry to the cardholder's browser) or `PREPAID_CARD_PIN` (reveal or set the card PIN). The token is redeemed directly by the cardholder's browser against PayQuicker, keeping your servers outside of PCI scope. See [Tokens](page:concepts/working-with-tokens) for the broader identifier-token model. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_data_token_object = PrepaidCardDataTokenObject.new(
  source_token: 'dest-925b8e69-7380-4827-b127-fda0801b090a',
  operation_token: 's3tPZJKlxOhN9w3/HllthMBxaFA+XPYPFz3g...',
  purpose: 'PREPAID_CARD_DATA',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/prepaid-cards/dest-925b8e69-7380-4827-b127-fda0801b090a/show',
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

