
# Receipt Details

Detailed information about a receipt including bank account and branch details

*This model accepts additional fields of type Object.*

## Structure

`ReceiptDetails`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `bank_account_id` | `String` | Optional | Bank account ID for the bank account |
| `bank_account_id_type` | `String` | Optional | Classifies bank account [field types](page:additional-api-information/bank-account-field-types) |
| `bank_name` | `String` | Optional | Name of the bank the account is registered to |
| `bank_id` | `String` | Optional | The bank id |
| `bank_id_type` | `String` | Optional | Classifies bank account [field types](page:additional-api-information/bank-account-field-types) |
| `branch_address` | `String` | Optional | The bank branch address |
| `branch_city` | `String` | Optional | The bank branch city |
| `branch_id` | `String` | Optional | The bank branch id |
| `branch_name` | `String` | Optional | The bank branch name |
| `branch_postal_code` | `String` | Optional | The bank branch postal code |
| `branch_phone_number` | `String` | Optional | The bank branch phone number |
| `branch_region` | `String` | Optional | The bank branch region |
| `beneficary_tax_id` | `String` | Optional | The beneficiary's tax id |
| `beneficary_tax_id_type` | `String` | Optional | Classifies bank account [field types](page:additional-api-information/bank-account-field-types) |
| `beneficary_name` | `String` | Optional | The name of the person chosen to inherit your account |
| `memo` | `String` | Optional | Optional internal memo, not visible to the user. |
| `note` | `String` | Optional | Optional comments visible to the user. |
| `correlation_token` | `String` | Optional | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `card_expiry_date` | `String` | Optional | Date that the card will expire |
| `card_holder_name` | `String` | Optional | Name of the card's owner |
| `card_number` | `String` | Optional | Unique number on the prepaid card |
| `electronic_wallet_account_number` | `String` | Optional | Account number for the electronic wallet |
| `electronic_wallet_account_number_type` | `String` | Optional | Classifies the field types submitted when creating or updating an electronic-wallet [Instrument](page:resources/instruments) — for example, the wallet's account ID, the registered phone number, or the recipient name. Required fields vary by provider, country, and currency; discover them via `POST /instruments/requirements/search`. |
| `electronic_wallet_government_id` | `String` | Optional | Government ID for the electronic wallet |
| `electronic_wallet_government_id_type` | `String` | Optional | Classifies the field types submitted when creating or updating an electronic-wallet [Instrument](page:resources/instruments) — for example, the wallet's account ID, the registered phone number, or the recipient name. Required fields vary by provider, country, and currency; discover them via `POST /instruments/requirements/search`. |
| `electronic_wallet_type` | `String` | Optional | Provider type of an electronic-wallet [Instrument](page:resources/instruments) — identifies which third-party wallet network the destination uses (e.g., `PAYPAL`, `VENMO`, `AIRTEL_MONEY`). Available providers depend on the payee's country and the program's configuration; discover them via `POST /instruments/requirements/search`. See [Transfer Method Types](page:additional-api-information/transfer-method-types) for the rails reference. |
| `phone_number` | [`PhoneNumberObject`](../../doc/models/phone-number-object.md) | Optional | A phone number with type classifier. |
| `electronic_funds_transfer_type` | `String` | Optional | Underlying electronic-funds-transfer (EFT) operation kind for a bank-rail movement — for example, `MANUAL` (operator-initiated) vs automated rail variants. See [Bank Transfer Types](page:additional-api-information/bank-transfer-types) for the full list. |
| `electronic_funds_transfer_failure_type` | `String` | Optional | The type of failure for a bank transfer. See [EFT Failure Types](page:additional-api-information/eft-failure-types) for the full list of failure codes. |
| `electronic_transfer_status_type` | `String` | Optional | The status of a bank transfer. See [EFT Status Types](page:additional-api-information/eft-status-types) for the full list of statuses. |
| `processor_reference` | `String` | Optional | Unique identifer of the transction at the processing financial institution. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
receipt_details = ReceiptDetails.new(
  bank_account_id: '021000021',
  bank_account_id_type: 'BANK_ACH_ABA',
  bank_name: 'JPMorgan Chase Bank',
  bank_id: '021000021',
  bank_id_type: 'BANK_ACH_ABA',
  branch_address: '1111 Polaris Parkway',
  branch_city: 'Columbus',
  branch_id: '021000021',
  branch_name: 'Columbus Main Branch',
  branch_postal_code: '43240',
  branch_phone_number: '+16142481000',
  branch_region: 'OH',
  beneficary_tax_id: '123-45-6789',
  beneficary_tax_id_type: 'GOV_TAX_ID',
  beneficary_name: 'Alberta Purdy',
  memo: 'Q1 incentive bonus',
  note: 'Funds delivered same day',
  correlation_token: 'pmnt-7d631de0-3467-4ece-b408-29dc748ed615',
  card_expiry_date: '2029-03',
  card_holder_name: 'ALBERTA PURDY',
  card_number: '483318******4628',
  electronic_wallet_account_number: 'alberta.purdy@payquicker.testinator.com',
  electronic_wallet_account_number_type: 'EWALLET_EMAIL',
  electronic_wallet_government_id: '123-45-6789',
  electronic_wallet_government_id_type: 'EWALLET_GOV_TAX_ID',
  electronic_wallet_type: 'PAYPAL',
  phone_number: PhoneNumberObject.new(
    number: '+16142481000',
    country: 'US',
    number_type: 'MOBILE'
  ),
  electronic_funds_transfer_type: 'ACH',
  electronic_funds_transfer_failure_type: 'UNDEFINED',
  electronic_transfer_status_type: 'COMPLETED',
  processor_reference: 'c3c600111b62426797e8596bd1dcaa5f',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

