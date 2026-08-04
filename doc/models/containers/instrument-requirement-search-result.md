
# Instrument Requirement Search Result

Polymorphic instrument requirement list result. Resolves to the appropriate typed requirement list based on the instrumentType.

## Data Type

`BankAccountRequirementListResult | EwalletRequirementListResult`

## Cases

| Type |
|  --- |
| [`BankAccountRequirementListResult`](../../../doc/models/bank-account-requirement-list-result.md) |
| [`EwalletRequirementListResult`](../../../doc/models/ewallet-requirement-list-result.md) |

## BankAccountRequirementListResult

### Initialization Code

#### Example

```ruby
value = BankAccountRequirementListResult.new(
  payload: [
    BankAccountRequirement.new(
      country: 'US',
      currency: 'USD',
      fee: FeeConfiguration.new(
        category: 'COMPANY',
        distribution: [
          FeeDistribution.new(
            amount: '1.02',
            currency: 'USD',
            description: 'string',
            formatted_amount: '$0.05 USD',
            percentage: '50.00',
            responsibility: 'COMPANY',
            responsibility_source: 'CREDIT',
            source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'
          )
        ],
        source: 'TRANSACTION',
        total_amount: '50.00',
        transaction_amount: '50.00',
        type: 'BANK_TRANSFER_REVERSAL_STOP_NOC',
        value_amount: 'string',
        value_type: 'PERCENTAGE'
      ),
      source_currency: 'USD',
      requirements: [
        BankAccountRequiredFields.new(
          format: BankAccountRequirementFormat.new(
            example: 'string',
            legend: [
              BankAccountRequirementFormatLegend.new(
                key: 'string',
                description: 'string'
              )
            ]
          ),
          requirement: 'BANK_ACH_ABA',
          description: 'string',
          validators: [
            BankAccountRequirementValidator.new(
              expression: 'string',
              validator_type: 'LENGTH'
            )
          ]
        )
      ],
      additional_properties: {
        'sourcecountry' => JSON.parse('"US"')
      }
    )
  ],
  instrument_type: InstrumentType::BANK,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

## EwalletRequirementListResult

### Initialization Code

#### Example

```ruby
value = EwalletRequirementListResult.new(
  payload: [
    EwalletRequirement.new(
      electronic_wallet_type: 'AIRTEL_MONEY',
      country: 'US',
      currency: 'USD',
      fee: FeeConfiguration.new(
        category: 'COMPANY',
        distribution: [
          FeeDistribution.new(
            amount: '1.02',
            currency: 'USD',
            description: 'string',
            formatted_amount: '$0.05 USD',
            percentage: '50.00',
            responsibility: 'COMPANY',
            responsibility_source: 'CREDIT',
            source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860'
          )
        ],
        source: 'TRANSACTION',
        total_amount: '50.00',
        transaction_amount: '50.00',
        type: 'BANK_TRANSFER_REVERSAL_STOP_NOC',
        value_amount: 'string',
        value_type: 'PERCENTAGE'
      ),
      source_currency: 'USD',
      requirements: [
        EwalletRequiredFields.new(
          format: EwalletRequirementFormat.new(
            example: 'string',
            legend: [
              EwalletRequirementFormatLegend.new(
                key: 'string',
                description: 'string'
              )
            ]
          ),
          requirement: 'UNDEFINED',
          description: 'string',
          validators: [
            EwalletRequirementValidator.new(
              expression: 'string',
              validator_type: 'LENGTH'
            )
          ]
        )
      ],
      additional_properties: {
        'sourcecountry' => JSON.parse('"US"')
      }
    )
  ],
  instrument_type: InstrumentType1::EWALLET,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

