
# Payment Job Search Filter Item

A single filter row inside a `POST /jobs/payments/search` request body's `filters` array. The `field` value comes from `PaymentJobSearchFilterField`; valid `comparison` values depend on the field's data type (see [Filtering & Sorting](page:concepts/filtering-sorting)). See [`Payment Job Search Fields`](page:additional-api-information/payment-job-search-fields#filter-fields) for the complete catalog of supported field names.

*This model accepts additional fields of type Object.*

## Structure

`PaymentJobSearchFilterItem`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Required | Filterable fields for payment job search. |
| `comparison` | `String` | Required | Comparison operator for filter expressions.<br>Not all operators are valid for every field — see per-endpoint<br>documentation for operator restrictions. |
| `value` | `String` | Required | The filter value. Dates should be ISO 8601 format. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
payment_job_search_filter_item = PaymentJobSearchFilterItem.new(
  field: 'STATUS',
  comparison: 'EQUAL_TO',
  value: 'COMPLETED',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

