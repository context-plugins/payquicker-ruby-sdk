
# User Event Base

A single [User Event](page:resources/events) — captures an action the payee must take (or has taken) during onboarding or status changes (e.g., `DOCUMENTS_REQUIRED`, `KYC_APPROVED`). See [Event Status Types](page:additional-api-information/event-status-types).

*This model accepts additional fields of type Object.*

## Structure

`UserEventBase`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `event_status` | `String` | Required | Indicates the current status type of an [event](page:resources/events). See [Event Status Types](page:additional-api-information/event-status-types) for the full list of statuses. |
| `user_action` | `String` | Required | Action required from the user |
| `user_impact` | `String` | Required | Level of impact on the user |
| `user_event` | `String` | Required | Category of registration tied to a user [event](page:resources/events) — `WALLET_REGISTRATION` (electronic-wallet onboarding), `PREPAID_CARD_REGISTRATION` (prepaid-card onboarding), or `UPDATE_REGISTRATION` (a change to existing registration details). Used by the platform to group required actions surfaced to the payee during onboarding flows. See [Event Status Types](page:additional-api-information/event-status-types) for the lifecycle of each event. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_event_base = UserEventBase.new(
  token: 'evnt-8c2f1a35-84bb-4098-85ff-ce537f1897ad',
  event_status: 'COMPLETED',
  user_action: 'NO_ACTION',
  user_impact: 'NO_IMPACT',
  user_event: 'PREPAID_CARD_REGISTRATION',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

