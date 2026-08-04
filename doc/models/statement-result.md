
# Statement Result

Statement result response combining statement object and metadata

*This model accepts additional fields of type Object.*

## Structure

`StatementResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `content_base_64` | `String` | Required, Read-only | Program agreement content |
| `filename` | `String` | Required, Read-only | The name given to a computer file in order to distinguish it from other files |
| `mime_type` | `String` | Required, Read-only | A label used to identify a type of data. Acts like a file extension on the internet. |
| `token` | `String` | Required, Read-only | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `user_token` | `String` | Required, Read-only | Auto-generated unique identifier representing a user, prefixed with `user-`.<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^user-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `program_user_id` | `String` | Required, Read-only | Program-assigned identifier for the user. Used by Hosted Portal programs (with `email`) to address payees in transactional and search bodies. See [Scope Discriminator](page:concepts/scope-discriminator).<br><br>**Constraints**: *Minimum Length*: `5`, *Maximum Length*: `100` |
| `prepaid_card_token` | `String` | Optional, Read-only | Auto-generated unique identifier representing a dest, prefixed with dest-. |
| `from` | `Date` | Required, Read-only | Beginning date and time of a prepaid card statement |
| `to` | `Date` | Required, Read-only | Ending date and time of a prepaid card statement |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `meta` | [`MetadataItems`](../../doc/models/metadata-items.md) | Required | Metadata items including timezone, language, and version information |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
statement_result = StatementResult.new(
  content_base64: 'contentBase648',
  filename: 'filename8',
  mime_type: 'mimeType2',
  token: 'token0',
  user_token: 'userToken6',
  program_user_id: 'programUserId8',
  from: Date.iso8601('2016-03-13'),
  to: Date.iso8601('2016-03-13'),
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  prepaid_card_token: 'prepaidCardToken0',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

