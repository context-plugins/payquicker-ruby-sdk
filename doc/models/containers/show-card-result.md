
# Show Card Result

Polymorphic prepaid card data result. Discriminated by the `format` property. Returns either text fields (PAN, CVV, expiry, name) or an image (Base64), depending on the format requested.

## Data Type

`PrepaidCardDataTextResult | PrepaidCardDataImageResult`

## Cases

| Type |
|  --- |
| [`PrepaidCardDataTextResult`](../../../doc/models/prepaid-card-data-text-result.md) |
| [`PrepaidCardDataImageResult`](../../../doc/models/prepaid-card-data-image-result.md) |

## PrepaidCardDataTextResult

### Initialization Code

#### Example

```ruby
value = PrepaidCardDataTextResult.new(
  pan: '483318******4628',
  cvv: 'string',
  exp: 'string',
  name: 'string',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  format: Format::TEXT,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  )
)
```

## PrepaidCardDataImageResult

### Initialization Code

#### Example

```ruby
value = PrepaidCardDataImageResult.new(
  image: 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAA...',
  side: 'FRONT',
  source_token: 'acct-3908ab5a-6ce1-474d-8b80-a63a7b147860',
  format: Format1::IMAGE,
  links: {
    'self' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'GET',
      title: 'Self'
    ),
    'accept' => NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-2bbfc967-d12e-4647-a887-d905172fb4bc',
      method: 'POST',
      title: 'Accept Quote'
    )
  },
  meta: MetadataItems.new(
    timezone: 'UTC',
    language: 'en-US',
    version: '2026.02.01',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh'
  )
)
```

