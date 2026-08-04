
# Invitation Job Item Exception

A validation or processing exception for an [Invitation Job](page:resources/invitation-jobs) row — captures the error code, field, and message for an invitation that could not be processed. Returned alongside successful rows so the caller can fix and resubmit just the failures.

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobItemException`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `field` | `String` | Optional | The field that caused the exception |
| `phase` | `String` | Optional | The phase in which the exception occurred |
| `message` | `String` | Optional | Human-readable description of the exception |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_item_exception = InvitationJobItemException.new(
  field: 'EMAIL_ADDRESS',
  phase: 'DATA_VALIDATION',
  message: 'Email address is required',
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

