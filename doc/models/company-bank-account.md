
# Company Bank Account

Create or update a bank-account [Instrument](page:resources/instruments) on a program account (the `instrumentType` discriminator must be `BANK`). The required fields vary by country and currency — discover them via `POST /instruments/requirements/search`. See [Bank Account Field Types](page:additional-api-information/bank-account-field-types) and [Bank Account Types](page:additional-api-information/bank-account-types).

*This model accepts additional fields of type Object.*

## Structure

`CompanyBankAccount`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `instrument_type` | [`InstrumentType`](../../doc/models/instrument-type.md) | Required | Discriminator value identifying this as a bank account instrument.<br><br>**Default**: `InstrumentType::BANK` |
| `account_token` | `String` | Required | Account token identifying the target account. |
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
company_bank_account = CompanyBankAccount.new(
  instrument_type: InstrumentType::BANK,
  account_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
  purpose: 'BUSINESS',
  country: 'US',
  currency: 'USD',
  description: 'Gateway company bank account',
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
      value: '11022233',
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
      value: 'Hopster Rideshare',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  type: 'CHECKING',
  method: 'US_SAMEDAY_IACH',
  address: BankAccountAddress.new(
    address1: '200 Company Avenue',
    city: 'Rochester',
    postal_code: '14623',
    country: 'US',
    address2: 'address28',
    address3: 'address36',
    region: 'NY',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

