
# Company Balance Object

Company-side [Balance](page:resources/balances) returned with `balanceType: COMPANY` — the funding / clearing account view. Counterpart to `UserBalanceObject`. See [Balances](page:resources/balances).

*This model accepts additional fields of type Object.*

## Structure

`CompanyBalanceObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `amount` | `String` | Required | Amount of money in the account, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision))<br><br>**Default**: `'0'` |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `formatted_amount` | `String` | Required | Combination of the amount and currency type. On transfer-quote responses this string is **always sign-free** (never contains `-`, `(`, or `)`) — it can be rendered directly without further sign-stripping. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative))<br><br>**Default**: `'$0.05 USD'` |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `balance_type` | [`BalanceType`](../../doc/models/balance-type.md) | Required | Discriminator on a balance object. `COMPANY` selects a `CompanyBalanceObject`; `USER` selects a `UserBalanceObject`. See [Balance Type](page:resources/balances) for the discriminator semantics.<br><br>**Default**: `BalanceType::COMPANY` |
| `program_token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Optional | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `prepaid_card_token` | `String` | Optional | Auto-generated unique identifier representing a dest, prefixed with dest-. |
| `related_cards` | `Array[String]` | Optional | Array of prepaid cards related to this balance, only populated if the balance is shared between multiple cards (e.g. physical, instant, ApplePay, GooglePay, etc.) |
| `capabilities` | `Array[String]` | Required | Capabilities the platform will allow this balance to be used for — for example, `PAYMENT_SOURCE` if the balance can fund outbound payments, `PREPAID_CARD` if it is a prepaid-card balance. See [Balance Capabilities](page:resources/balances) for the value list. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
company_balance_object = CompanyBalanceObject.new(
  amount: '100000.00',
  currency: 'USD',
  formatted_amount: '$100,000.00 USD',
  token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  balance_type: BalanceType::COMPANY,
  program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
  capabilities: [
    'PAYMENT_SOURCE',
    'SPENDBACK_TARGET'
  ],
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/balances/search',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'program' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/programs/prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
      method: 'GET',
      title: 'Program',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  program_user_id: 'programUserId0',
  prepaid_card_token: 'prepaidCardToken8',
  related_cards: [],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

