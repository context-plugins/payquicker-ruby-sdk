
# Agreement Object

A legal [Agreement](page:resources/agreements) record (e.g., `CARD_HOLDER_AGREEMENT`, program terms) returned in API responses with HATEOAS navigation links. The set of agreement types in effect for a program is configured by PayQuicker at onboarding. See [Agreements](page:resources/agreements) and [HATEOAS](page:concepts/hateoas).

*This model accepts additional fields of type Object.*

## Structure

`AgreementObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `content_base_64` | `String` | Required | Program agreement content |
| `url` | `String` | Required | Full path of the URI to the content for the program agreement |
| `type` | `String` | Required | Kind of legal [Agreement](page:resources/agreements) — for example, `CARD_HOLDER_AGREEMENT` (terms a payee must accept before holding a prepaid card), program terms, privacy policy, etc. The full set of agreement types in effect for a program is configured by PayQuicker at onboarding. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
agreement_object = AgreementObject.new(
  token: 'agmt-d116c81e-576f-403b-c3d4-e91dc33c947c',
  content_base64: '<BASE_64_CONTENT>',
  url: 'https://cdn.mypayquicker.build/content/Agreements/Cardholder/v1/Languages_EN_US/CardholderAgreement-Commercial-10k-NO-DDA-Sutton-USD.pdf',
  type: 'CARD_HOLDER_AGREEMENT',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/programs/prog-8a907a6a-6aef-d6cb-14a4-301bdfeea9a5/agreements/agmt-d116c81e-576f-403b-c3d4-e91dc33c947c',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  },
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

