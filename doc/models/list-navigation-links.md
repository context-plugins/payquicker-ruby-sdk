
# List Navigation Links

HATEOAS navigation links classifying the related list resources (e.g., `next`, `previous`, `first`, `last`). Returned on every paged list / search response. See [HATEOAS](page:concepts/hateoas) and [Pagination](page:concepts/pagination).

*This model accepts additional fields of type Object.*

## Structure

`ListNavigationLinks`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `mself` | [`NavigationLink`](../../doc/models/navigation-link.md) | Required | The properties of a navigation link. |
| `first` | [`NavigationLink`](../../doc/models/navigation-link.md) | Required | The properties of a navigation link. |
| `last` | [`NavigationLink`](../../doc/models/navigation-link.md) | Required | The properties of a navigation link. |
| `mnext` | [`NavigationLink`](../../doc/models/navigation-link.md) | Optional | The properties of a navigation link. |
| `prev` | [`NavigationLink`](../../doc/models/navigation-link.md) | Optional | The properties of a navigation link. |
| `additional_properties` | `Hash[String, Object]` | Optional | - |

## Example

```ruby
list_navigation_links = ListNavigationLinks.new(
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
)
```

