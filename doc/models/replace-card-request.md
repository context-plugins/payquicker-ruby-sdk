
# Replace Card Request

Request object for replacing a prepaid card

*This model accepts additional fields of type Object.*

## Structure

`ReplaceCardRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Required | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `card_package` | `String` | Required | Identifier of the card package that governs the physical artwork, packaging, and shipping for a [prepaid card](page:resources/prepaid-cards). Card packages are configured per-program and assigned at card order; consult your PayQuicker representative for the package identifiers available to your program. |
| `card_replacement_reason` | `String` | Required | Reason for [prepaid card](page:resources/prepaid-cards) replacement. See [Card Replacement Reason Types](page:additional-api-information/card-replacement-reason-types) for the full list. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
replace_card_request = ReplaceCardRequest.new(
  user_token: 'user-4ae4f530-d6f4-4e70-aee5-d0d57719f9d6',
  card_package: '71290',
  card_replacement_reason: 'COMPROMISED',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

