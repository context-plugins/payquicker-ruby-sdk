
# Agreement Base

Agreement — a legal document (cardholder agreement, terms and conditions, privacy policy, etc.) that a payee or program must accept as part of onboarding or card issuance. Carries the agreement type, the document URL, and the document contents (base64-encoded) for in-app display or download. Read-only; agreements are configured per program by PayQuicker. See [Agreements](page:resources/agreements).

*This model accepts additional fields of type Object.*

## Structure

`AgreementBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `content_base_64` | `String` | Required | Program agreement content |
| `url` | `String` | Required | Full path of the URI to the content for the program agreement |
| `type` | `String` | Required | Kind of legal [Agreement](page:resources/agreements) — for example, `CARD_HOLDER_AGREEMENT` (terms a payee must accept before holding a prepaid card), program terms, privacy policy, etc. The full set of agreement types in effect for a program is configured by PayQuicker at onboarding. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
agreement_base = AgreementBase.new(
  token: 'agmt-d116c81e-576f-403b-c3d4-e91dc33c947c',
  content_base64: '<BASE_64_CONTENT>',
  url: 'https://cdn.mypayquicker.build/content/Agreements/Cardholder/v1/Languages_EN_US/CardholderAgreement-Commercial-10k-NO-DDA-Sutton-USD.pdf',
  type: 'CARD_HOLDER_AGREEMENT',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

