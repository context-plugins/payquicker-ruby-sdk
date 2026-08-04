
# Ewallet Requirement List Result

Paginated list of electronic wallet requirement objects with configuration details, fees, and field validators

*This model accepts additional fields of type Object.*

## Structure

`EwalletRequirementListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[EwalletRequirement]`](../../doc/models/ewallet-requirement.md) | Required | - |
| `instrument_type` | [`InstrumentType1`](../../doc/models/instrument-type-1.md) | Required | Discriminator value identifying this as an electronic wallet instrument.<br><br>**Default**: `InstrumentType1::EWALLET` |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_requirement_list_result = EwalletRequirementListResult.new(
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
            source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
            additional_properties: {
              'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
            }
          )
        ],
        source: 'TRANSACTION',
        total_amount: '50.00',
        transaction_amount: '50.00',
        type: 'BANK_TRANSFER_REVERSAL_STOP_NOC',
        value_amount: 'string',
        value_type: 'PERCENTAGE',
        additional_properties: {
          'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
        }
      ),
      source_country: 'sourceCountry6',
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
    version: '2026.02.01',
    search_id: '00002478-0000-0000-0000-000000000000',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    prev: nil,
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

