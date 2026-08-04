
# Statement List Object

A [Statement](page:resources/statements) listing wrapper, returned with HATEOAS navigation links to each underlying statement and to the result-set's pages. See [Statements](page:resources/statements) and [Pagination](page:concepts/pagination).

*This model accepts additional fields of type Object.*

## Structure

`StatementListObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `user_token` | `String` | Optional, Read-only | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required, Read-only | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `prepaid_card_token` | `String` | Optional, Read-only | Auto-generated unique identifier representing a dest, prefixed with dest-. |
| `from` | `Date` | Required, Read-only | Beginning date and time of a prepaid card statement |
| `to` | `Date` | Required, Read-only | Ending date and time of a prepaid card statement |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
statement_list_object = StatementListObject.new(
  token: 'docu-ee143008-f1a0-4e4f-820a-5b48d34c4fc3',
  program_user_id: '873e5076-7161-96cf-6b60-5374b08c31f0',
  from: Date.iso8601('2025-12-12'),
  to: Date.iso8601('2026-01-11'),
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/statements/docu-ee143008-f1a0-4e4f-820a-5b48d34c4fc3',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  user_token: 'user-f659f323-0dc5-4d48-9e55-059c136d6a8d',
  prepaid_card_token: 'dest-2e4fa4e3-3d31-429b-9f4b-39a2899ba088',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

