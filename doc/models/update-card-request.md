
# Update Card Request

Request object for updating prepaid card details

*This model accepts additional fields of type Object.*

## Structure

`UpdateCardRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `user_token` | `String` | Required | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `card_package` | `String` | Required | Identifier of the card package that governs the physical artwork, packaging, and shipping for a [prepaid card](page:resources/prepaid-cards). Card packages are configured per-program and assigned at card order; consult your PayQuicker representative for the package identifiers available to your program. |
| `status` | `String` | Required | Current status of the [prepaid card](page:resources/prepaid-cards). See [Card Status Types](page:additional-api-information/card-status-types) for the full list of statuses and allowed transitions. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
update_card_request = UpdateCardRequest.new(
  user_token: 'user-4ae4f530-d6f4-4e70-aee5-d0d57719f9d6',
  card_package: '71290',
  status: 'ACTIVATED',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

