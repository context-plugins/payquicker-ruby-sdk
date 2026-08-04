
# Prepaid Card Base

Prepaid card — a payee's payment instrument that can be funded from a user wallet, used at point of sale, and added to mobile wallets (Apple Pay / Google Pay / Samsung Pay) where the program supports it. Each card carries a status, a network (Mastercard / Visa), a country and currency, and a list of capabilities that govern what the card can do (reveal PAN, set PIN, mobile-wallet provisioning, etc.). Token prefix `dest-` (cards share the destination-token namespace with bank-account and electronic-wallet Instruments). See [Prepaid Cards](page:resources/prepaid-cards) and [Sensitive Card Operations](page:resources/sensitive-card-operations) for the PCI-scoped flows that handle PAN, CVV, and PIN.

*This model accepts additional fields of type Object.*

## Structure

`PrepaidCardBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Optional, Read-only | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `card_network` | `String` | Required, Read-only | Card network on which a [prepaid card](page:resources/prepaid-cards) is issued — for example, `MASTER_CARD` or `VISA`. The network affects acceptance, mobile-wallet eligibility, and the regulatory rules under which authorizations are processed. |
| `card_number` | `String` | Required, Read-only | Unique number on the prepaid card |
| `card_package` | `String` | Required, Read-only | Identifier of the card package that governs the physical artwork, packaging, and shipping for a [prepaid card](page:resources/prepaid-cards). Card packages are configured per-program and assigned at card order; consult your PayQuicker representative for the package identifiers available to your program. |
| `country` | `String` | Required, Read-only | Throughout the PayQuicker API, the usage of the 2-letter alpha code is used in place of the country name, e.g., for bank country or residential country. The 2-letter codes adhere to the ISO 3166-1 spec and are listed here for convenience. |
| `created_at` | `DateTime` | Required, Read-only | Date and time when the resource was created. ISO 8601 format. |
| `currency` | `String` | Required, Read-only | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `cvv` | `String` | Optional, Read-only | Three- or four-digit Card Verification Value (CVV) number displayed on the back of a credit or debit card |
| `expires` | `String` | Optional, Read-only | Date and time at which the object expires. ISO 8601 format. |
| `status` | `String` | Required, Read-only | Current status of the [prepaid card](page:resources/prepaid-cards). See [Card Status Types](page:additional-api-information/card-status-types) for the full list of statuses and allowed transitions. |
| `bank_in_details` | [`Array[BankAccountField]`](../../doc/models/bank-account-field.md) | Optional, Read-only | Bank account details for loading funds onto the card |
| `capabilities` | `Array[String]` | Optional, Read-only | Available card capabilities and features |
| `user_token` | `String` | Required, Read-only | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
prepaid_card_base = PrepaidCardBase.new(
  token: 'dest-8a3e8d5c-f799-4b41-9f05-11bbd4b552bb',
  card_network: 'MASTERCARD',
  card_number: '554717******7287',
  card_package: 'db157bea-2930-4096-9a5b-e7f662734d64',
  country: 'US',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:06:26.0000000Z'),
  currency: 'USD',
  status: 'PENDING_ACTIVATION',
  user_token: 'user-e3874103-10bd-44cf-ab5b-1b311d57cb94',
  program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
  cvv: '***',
  expires: '05/2029',
  bank_in_details: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '021000021',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    BankAccountField.new(
      key: 'BANK_ACH_ACCOUNT_NUMBER',
      value: '1234567890',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  capabilities: [
    'BANK_IN',
    'SET_PIN',
    'APPLEPAY',
    'GOOGLEPAY',
    'SAMSUNGPAY'
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

