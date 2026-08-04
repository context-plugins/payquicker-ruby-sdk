
# Invitation Job Item

A single invitation item within a batch invitation job. Supports mixed individual and business invitations via anyOf.

## Data Type

`IndividualUserInvitation | BusinessUserInvitation`

## Cases

| Type |
|  --- |
| [`IndividualUserInvitation`](../../../doc/models/individual-user-invitation.md) |
| [`BusinessUserInvitation`](../../../doc/models/business-user-invitation.md) |

## IndividualUserInvitation

### Initialization Code

#### Example

```ruby
value = IndividualUserInvitation.new(
  program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
  program_user_id: 'PQAPI-be274f843384f544c5ae0463a7fd87bc',
  email: 'marcel74@payquicker.testinator.com',
  issue_card: false,
  user_type: UserType::INDIVIDUAL,
  notify_user: true,
  first_name: 'Marcel',
  last_name: 'Glover',
  date_of_birth: Date.iso8601('1985-04-15'),
  gender: 'MALE',
  language: 'en-US',
  country_of_birth: 'US',
  country_of_nationality: 'US',
  tax_resident_status: 'RESIDENT',
  government_id_type: 'SSN',
  government_id: '123-45-6789',
  occupation_title: 'Software Engineer',
  occupation_type: 'TECHNOLOGY',
  primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
  addresses: [
    AddressObject.new(
      address_type: 'RESIDENTIAL',
      address_line1: '2083 Crona Walks',
      city: 'Deangelomouth',
      region: 'VA',
      postal_code: '51456',
      country: 'US',
      address_line2: 'Suite 443'
    )
  ],
  phone_numbers: [
    PhoneNumberObject.new(
      number: '+15852282715',
      country: 'US',
      number_type: 'MOBILE'
    )
  ]
)
```

## BusinessUserInvitation

### Initialization Code

#### Example

```ruby
value = BusinessUserInvitation.new(
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
      country: 'US',
      address_line2: 'Suite 010'
    )
  ],
  phone_numbers: [
    PhoneNumberObject.new(
      number: '+15852282715',
      country: 'US',
      number_type: 'BUSINESS'
    )
  ]
)
```

