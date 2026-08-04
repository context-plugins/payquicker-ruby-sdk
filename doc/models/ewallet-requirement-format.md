
# Ewallet Requirement Format

*This model accepts additional fields of type Object.*

## Structure

`EwalletRequirementFormat`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `example` | `String` | Optional | Example of a requirement generated from the validator(s) |
| `legend` | [`Array[EwalletRequirementFormatLegend]`](../../doc/models/ewallet-requirement-format-legend.md) | Optional | Array of legend items explaining field format placeholders |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
ewallet_requirement_format = EwalletRequirementFormat.new(
  example: 'string',
  legend: [
    EwalletRequirementFormatLegend.new(
      key: 'string',
      description: 'string',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

