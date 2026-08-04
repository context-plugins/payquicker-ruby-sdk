
# User Bank Account

Create or update a bank-account [Instrument](page:resources/instruments) for a payee (the `instrumentType` discriminator must be `BANK`). Include `userToken` to address the payee. Required fields vary by country and currency — discover them via `POST /instruments/requirements/search`. See [Bank Account Field Types](page:additional-api-information/bank-account-field-types).

*This model accepts additional fields of type Object.*

## Structure

`UserBankAccount`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `instrument_type` | [`InstrumentType`](../../doc/models/instrument-type.md) | Required | Discriminator value identifying this as a bank account instrument.<br><br>**Default**: `InstrumentType::BANK` |
| `user_token` | `String` | Required | User token identifying the target user. |
| `purpose` | `String` | Required | Ownership category of a bank-account [Instrument](page:resources/instruments) — `PERSONAL` (held by an individual payee) or `BUSINESS` (held by an entity). Determines applicable KYC and reporting rules. See [Bank Account Types](page:additional-api-information/bank-account-types) for the value list. |
| `country` | `String` | Required | ISO 3166-1 alpha-2 country code (two-letter, e.g., `US`, `GB`, `DE`). Used throughout the PayQuicker API in place of the full country name — for residential / mailing addresses on [Users](page:resources/users), for the registered country of [bank-account](page:resources/instruments) and [electronic-wallet](page:resources/instruments) instruments, and to gate which destinations / methods are available to a payee. See [Country Codes](page:additional-api-information/country-codes) for the supported list. |
| `currency` | `String` | Required | ISO 4217 three-letter currency code (e.g. `USD`, `EUR`, `GBP`). See [Currency Codes](page:additional-api-information/currency-codes) for the supported list.<br><br>**Default**: `'USD'` |
| `description` | `String` | Required | User-supplied description of the bank account for reference |
| `fields` | [`Array[BankAccountField]`](../../doc/models/bank-account-field.md) | Required | Required bank account fields as determined by requirements |
| `type` | `String` | Required | Financial purpose of a bank-account [Instrument](page:resources/instruments) — for example, `CHECKING`, `SAVINGS`. See [Bank Account Types](page:additional-api-information/bank-account-types) for the full list. |
| `method` | `String` | Required | Underlying rail used to settle a `transferType: TRANSFER` to a bank-account or electronic-wallet [Instrument](page:resources/instruments). Examples: `IACH` (international ACH), `WIRE`, `LOCAL`. Available methods depend on the destination's country and currency — discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the full list. |
| `address` | [`BankAccountAddress`](../../doc/models/bank-account-address.md) | Optional | Address information for the bank account |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_bank_account = UserBankAccount.new(
  instrument_type: InstrumentType::BANK,
  user_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
  purpose: 'PERSONAL',
  country: 'US',
  currency: 'USD',
  description: 'Primary personal checking account',
  fields: [
    BankAccountField.new(
      key: 'BANK_ACH_ABA',
      value: '222371863',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    BankAccountField.new(
      key: 'BANK_BBAN',
      value: '1102224234',
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
    ),
    BankAccountField.new(
      key: 'BENEFICIARY_NAME',
      value: 'Maybelle Volkman',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH',
  address: nil,
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

