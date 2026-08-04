
# User Event Object

`UserEventBase` returned with HATEOAS navigation links — the form returned in API responses. See [Events](page:resources/events) and [Event Notifications](page:concepts/working-with-event-notifications).

*This model accepts additional fields of type Object.*

## Structure

`UserEventObject`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `token` | `String` | Required | Token representing the resource. Format is `<prefix>-<uuid>` where the prefix indicates the resource type. See [Tokens](page:concepts/working-with-tokens).<br><br>**Constraints**: *Minimum Length*: `41`, *Maximum Length*: `41`, *Pattern*: `^[a-z]{4}-[0-9A-Fa-f]{8}(?:-[0-9A-Fa-f]{4}){3}-[0-9A-Fa-f]{12}$` |
| `event_status` | `String` | Required | Indicates the current status type of an [event](page:resources/events). See [Event Status Types](page:additional-api-information/event-status-types) for the full list of statuses. |
| `user_action` | `String` | Required | Action required from the user |
| `user_impact` | `String` | Required | Level of impact on the user |
| `user_event` | `String` | Required | Category of registration tied to a user [event](page:resources/events) — `WALLET_REGISTRATION` (electronic-wallet onboarding), `PREPAID_CARD_REGISTRATION` (prepaid-card onboarding), or `UPDATE_REGISTRATION` (a change to existing registration details). Used by the platform to group required actions surfaced to the payee during onboarding flows. See [Event Status Types](page:additional-api-information/event-status-types) for the lifecycle of each event. |
| `links` | [`Hash[String, NavigationLink]`](../../doc/models/navigation-link.md) | Required | A map of navigation links related to the current resource, classified by their relationship to the current resource following RFC 8288 / HAL best practices. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
user_event_object = UserEventObject.new(
  token: 'evnt-8c2f1a35-84bb-4098-85ff-ce537f1897ad',
  event_status: 'COMPLETED',
  user_action: 'NO_ACTION',
  user_impact: 'NO_IMPACT',
  user_event: 'PREPAID_CARD_REGISTRATION',
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/users/user-9051a6a6-1c86-4666-8f93-79251ce7039d/events/evnt-8c2f1a35-84bb-4098-85ff-ce537f1897ad',
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

