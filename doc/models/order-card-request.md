
# Order Card Request

Request object for ordering a new prepaid card

*This model accepts additional fields of type Object.*

## Structure

`OrderCardRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Required | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `card_package` | `String` | Required | Identifier of the card package that governs the physical artwork, packaging, and shipping for a [prepaid card](page:resources/prepaid-cards). Card packages are configured per-program and assigned at card order; consult your PayQuicker representative for the package identifiers available to your program. |
| `program_token` | `String` | Required | Auto-generated unique identifier representing a program, prefixed with prog-<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^prog-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `card_reference_number` | `String` | Optional | Number that is printed on the back of a plastic card. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
order_card_request = OrderCardRequest.new(
  user_token: 'user-4ae4f530-d6f4-4e70-aee5-d0d57719f9d6',
  card_package: '71290',
  program_token: 'prog-6a272eca-9487-d83a-c9e4-8df8c9a7f6eb',
  card_reference_number: 'string',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

