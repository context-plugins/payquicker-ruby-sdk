
# Invitation Job Request

A batch invitation job consisting of one or more invitations.

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobRequest`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `items` | Array[[_IndividualUserInvitation](../../doc/models/individual-user-invitation.md) \| [_BusinessUserInvitation](../../doc/models/business-user-invitation.md)] | Required | A single invitation item within a batch invitation job. Supports mixed individual and business invitations via anyOf. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_request = InvitationJobRequest.new(
  items: [
    IndividualUserInvitation.new(
      program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
      program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
      email: 'marcel74@payquicker.testinator.com',
      issue_card: false,
      user_type: UserType::INDIVIDUAL,
      notify_user: true,
      first_name: 'Marcel',
      last_name: 'Glover',
      date_of_birth: Date.iso8601('1985-04-15'),
      gender: 'gender6',
      language: 'en-US',
      country_of_birth: 'US',
      country_of_nationality: 'US',
      addresses: [
        AddressObject.new(
          address_type: 'RESIDENTIAL',
          address_line1: '2083 Crona Walks',
          city: 'Deangelomouth',
          region: 'VA',
          postal_code: '51456',
          country: 'US'
        )
      ],
      phone_numbers: [
        PhoneNumberObject.new(
          number: '+15852282715',
          country: 'US',
          number_type: 'MOBILE'
        )
      ],
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    BusinessUserInvitation.new(
      program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
      program_user_id: 'PQAPI-04567a8983e1a44a1c8d1e02ab3f9b21',
      email: 'ops@acmemerch.com',
      issue_card: false,
      user_type: UserType1::BUSINESS,
      notify_user: true,
      first_name: 'Marcel',
      last_name: 'Glover',
      date_of_birth: Date.iso8601('1985-04-15'),
      contact_role: 'AUTHORIZED_SIGNER',
      business_name: 'ACME Merchandise LLC',
      language: 'en-US',
      addresses: [
        AddressObject.new(
          address_type: 'BUSINESS',
          address_line1: '9307 Kris Haven',
          city: 'New Darrion',
          region: 'SC',
          postal_code: '65707',
          country: 'US'
        )
      ],
      phone_numbers: [
        PhoneNumberObject.new(
          number: '+15852282715',
          country: 'US',
          number_type: 'BUSINESS'
        )
      ],
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

