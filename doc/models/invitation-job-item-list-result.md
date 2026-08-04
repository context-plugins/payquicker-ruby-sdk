
# Invitation Job Item List Result

Paginated list of invitation job item objects with metadata and pagination links

*This model accepts additional fields of type Object.*

## Structure

`InvitationJobItemListResult`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `payload` | [`Array[InvitationJobItemObject]`](../../doc/models/invitation-job-item-object.md) | Required | **Constraints**: *Minimum Items*: `0`, *Unique Items Required* |
| `meta` | [`ListMetadata`](../../doc/models/list-metadata.md) | Required | Pagination metadata returned on every list / search response — includes `page`, `pageSize`, `totalRecords`, and `totalPages`. See [Pagination](page:concepts/pagination) and [Searching](page:concepts/searching) for how this wraps the result envelope. |
| `links` | [`ListNavigationLinks`](../../doc/models/list-navigation-links.md) | Required | HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination). |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
invitation_job_item_list_result = InvitationJobItemListResult.new(
  payload: [
    InvitationJobItemObject.new(
      program_token: 'prog-15945a09-4e81-e758-ef04-c774fc30efc8',
      key: '<INVITATION_KEY>',
      url: 'https://tenant.mypayquicker.build/Welcome?invitationId=<INVITATION_KEY>',
      status: 'PENDING',
      registration_status: 'NOT_STARTED',
      created_at: DateTimeHelper.from_rfc3339('2026-02-07T22:23:09Z'),
      program_user_id: '00f1537c-963e-4b9a-98ce-c496255002d5',
      email: 'marcel74@payquicker.testinator.com',
      job_token: 'jobs-ee3aed27-8b7a-48da-ab1d-e86b382d846c',
      job_portal_id: 'ARCL1B6I34CMVKLC0',
      line_number: 1,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/invitations/invt-7f09b8e6-59d3-4c53-8a6f-8cdb1403b97d',
          method: 'GET',
          title: 'Self',
          additional_properties: {
            'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
          }
        )
      },
      token: 'invt-7f09b8e6-59d3-4c53-8a6f-8cdb1403b97d',
      currency: 'USD',
      user_token: 'userToken6',
      notify_user: false,
      issue_card: false,
      first_name: 'Marcel',
      last_name: 'Glover',
      language: 'en-US',
      user_type: 'INDIVIDUAL',
      date_of_birth: Date.iso8601('1985-04-15'),
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
      ],
      primary_user_token: 'user-19543ac9-83f9-4ef2-9964-71063789d0e1',
      exceptions: nil,
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    )
  ],
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01',
    search_id: '00002478-0000-0000-0000-000000000000',
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page',
      additional_properties: {
        'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
      }
    ),
    prev: nil,
    additional_properties: {
      'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
    }
  ),
  additional_properties: {
    'exampleAdditionalProperty' => JSON.parse('{"key1":"val1","key2":"val2"}')
  }
)
```

