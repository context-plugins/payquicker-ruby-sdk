
# User Balance Object

User-side [Balance](page:resources/balances) returned with `balanceType: USER` — the per-payee wallet view. Counterpart to `CompanyBalanceObject`. See [Balances](page:resources/balances).

*This model accepts additional fields of type Object.*

## Structure

`UserBalanceObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `amount` | `String` | Required | Amount of money in the account, represented as a string to preserve decimal precision ([learn more](page:concepts/monetary-precision))<br><br>**Default**: `'0'` |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `formatted_amount` | `String` | Required | Combination of the amount and currency type. On transfer-quote responses this string is **always sign-free** (never contains `-`, `(`, or `)`) — it can be rendered directly without further sign-stripping. ([learn more](page:concepts/monetary-precision#quote-responses-are-always-non-negative))<br><br>**Default**: `'$0.05 USD'` |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `balance_type` | [`BalanceType1`](../../doc/models/balance-type-1.md) | Required | Discriminator on a balance object. `COMPANY` selects a `CompanyBalanceObject`; `USER` selects a `UserBalanceObject`. See [Balance Type](page:resources/balances) for the discriminator semantics.<br><br>**Default**: `BalanceType1::USER` |
| `program_token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Optional | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `prepaid_card_token` | `String` | Optional | Auto-generated unique identifier representing a dest, prefixed with dest-. |
| `related_cards` | `Array[String]` | Optional | Array of prepaid cards related to this balance, only populated if the balance is shared between multiple cards (e.g. physical, instant, ApplePay, GooglePay, etc.) |
| `capabilities` | `Array[String]` | Required | Capabilities the platform will allow this balance to be used for — for example, `PAYMENT_SOURCE` if the balance can fund outbound payments, `PREPAID_CARD` if it is a prepaid-card balance. See [Balance Capabilities](page:resources/balances) for the value list. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `user_token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `funding_account_token` | `String` | Optional | Funding account token. Only populated when the balance has the FUNDS_LOAD_TARGET capability. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_balance_object = UserBalanceObject.new(
  amount: '2492.00',
  currency: 'USD',
  formatted_amount: '$2,492.00 USD',
  token: 'dest-925b8e69-7380-4827-b127-fda0801b090a',
  balance_type: BalanceType1::USER,
  program_token: 'prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5',
  capabilities: [
    'PREPAID_CARD',
    'USER_LOADABLE'
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
    'user' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/users/user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      method: 'GET',
      title: 'User',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'prepaidCard' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/prepaid-cards/dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
      method: 'GET',
      title: 'Prepaid Card',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
  prepaid_card_token: 'dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
  related_cards: [
    'dest-709c4084-75ca-41a7-99a4-5316ae470dff',
    'dest-ef104634-6c19-4f34-a1b1-9c92722d0c62'
  ],
  funding_account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

