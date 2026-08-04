
# Bank Account Object

A bank-account [Instrument](page:resources/instruments) destination registered on a user or company, returned with HATEOAS navigation links. The complementary creation/update model is `UserBankAccount` for payee instruments and `CompanyBankAccount` for program instruments. See [Instruments](page:resources/instruments) and [Bank Account Types](page:additional-api-information/bank-account-types).

*This model accepts additional fields of type Object.*

## Structure

`BankAccountObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token identifying the destination of funds — a bank-account or electronic-wallet [Instrument](page:resources/instruments), or a [Prepaid Card](page:resources/prepaid-cards). Prefix `dest-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^(acct\|dest\|user)-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `instrument_type` | [`InstrumentType`](../../doc/models/instrument-type.md) | Required | Discriminator value identifying this as a bank account instrument.<br><br>**Default**: `InstrumentType::BANK` |
| `purpose` | `String` | Required | Ownership category of a bank-account [Instrument](page:resources/instruments) — `PERSONAL` (held by an individual payee) or `BUSINESS` (held by an entity). Determines applicable KYC and reporting rules. See [Bank Account Types](page:additional-api-information/bank-account-types) for the value list. |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list. |
| `address` | [`BankAccountAddress`](../../doc/models/bank-account-address.md) | Optional | Address information for the bank account |
| `created_at` | `DateTime` | Required | Date and time when the resource was created. ISO 8601 format. |
| `description` | `String` | Optional | User-supplied description of the bank account for reference |
| `fields` | [`Array[BankAccountField]`](../../doc/models/bank-account-field.md) | Required | Array of bank account fields and values |
| `status` | `String` | Required | Current verification status of a bank-account [Instrument](page:resources/instruments) — for example, the account is awaiting validation, has been approved, or is under compliance hold. See [Bank Account Types](page:additional-api-information/bank-account-types) for the value list. |
| `type` | `String` | Required | Financial purpose of a bank-account [Instrument](page:resources/instruments) — for example, `CHECKING`, `SAVINGS`. See [Bank Account Types](page:additional-api-information/bank-account-types) for the full list. |
| `method` | `String` | Required | Underlying rail used to settle a `transferType: TRANSFER` to a bank-account or electronic-wallet [Instrument](page:resources/instruments). Examples: `IACH` (international ACH), `WIRE`, `LOCAL`. Available methods depend on the destination's country and currency — discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the full list. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
bank_account_object = BankAccountObject.new(
  token: 'dest-d1242f80-d94d-40ad-8cbb-568af10c45fb',
  instrument_type: InstrumentType::BANK,
  purpose: 'PERSONAL',
  country: 'US',
  currency: 'USD',
  created_at: DateTimeHelper.from_rfc3339('2026-05-02T22:56:03.0000000Z'),
  fields: [
    BankAccountField.new(
      key: 'BANK_BBAN',
      value: '****4234',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '****1863',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    BankAccountField.new(
      key: 'BENEFICIARY_NAME',
      value: 'Maybelle Volkman',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    BankAccountField.new(
      key: 'BANK_NAME',
      value: 'Central City Bank',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  status: 'VERIFIED',
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/instruments/dest-d1242f80-d94d-40ad-8cbb-568af10c45fb',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  address: nil,
  description: 'Primary personal checking account',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

