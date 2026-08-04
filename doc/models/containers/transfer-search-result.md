
# Transfer Search Result

Polymorphic quote list result using oneOf with a discriminator on transferType. Resolves to the appropriate typed list result based on the transferType property value in the response body.

## Data Type

`PaymentListResult | SpendbackListResult | PaymentRetractionListResult | TransferListResult | SpendbackRefundListResult`

## Cases

| Type |
|  --- |
| [`PaymentListResult`](../../../doc/models/payment-list-result.md) |
| [`SpendbackListResult`](../../../doc/models/spendback-list-result.md) |
| [`PaymentRetractionListResult`](../../../doc/models/payment-retraction-list-result.md) |
| [`TransferListResult`](../../../doc/models/transfer-list-result.md) |
| [`SpendbackRefundListResult`](../../../doc/models/spendback-refund-list-result.md) |

## PaymentListResult

### Initialization Code

#### Example

```ruby
value = PaymentListResult.new(
  payload: [
    PaymentObject.new(
      token: 'pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
      amount: '2.00',
      formatted_amount: '$2.00 USD',
      client_payment_ref: 'e53e963f051f4aa588a7515f13c82f3a',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:50.0000000Z'),
      currency: 'USD',
      program_user_id: 'PQAPI-a6f83b0f903fc540ee1cb41ed137983c',
      email: 'dyn1bec8scdnj2zk__alberta7@payquicker.testinator.com',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      quote_status: 'PENDING_ACCEPTANCE',
      transfer_type: TransferType::PAYMENT,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-c338dbd3-2b39-4ac5-9af1-3a1f691128ae',
          method: 'GET',
          title: 'Self'
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ2ZK',
      acceptance_mode: 'MANUAL_ACCEPT',
      destination_token: 'user-a2b8de56-c273-4ec0-8ede-0f677237812b',
      memo: 'Q2 performance bonus',
      note: 'Reissued after retracted payment',
      purpose: 'BONUS',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f',
      not_before: DateTimeHelper.from_rfc3339('2026-05-03T00:00:00.0000000Z'),
      not_after: DateTimeHelper.from_rfc3339('2026-06-03T00:00:00.0000000Z')
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
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  ),
  transfer_type: envrr
)
```

## SpendbackListResult

### Initialization Code

#### Example

```ruby
value = SpendbackListResult.new(
  payload: [
    SpendbackObject.new(
      token: 'spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
      amount: '0.50',
      formatted_amount: '$0.50 USD',
      client_spendback_ref: 'f48e4b082063492bb6e7d35408d98f83',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:01:40.0000000Z'),
      currency: 'USD',
      destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
      quote_status: 'ACCEPTED',
      transfer_type: TransferType4::SPENDBACK,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/spend-back/spnd-8985daf7-6854-4593-a00a-8b93b9d247e8',
          method: 'GET',
          title: 'Self'
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ2YW',
      acceptance_mode: 'AUTO_ACCEPT',
      fee: FeeConfiguration.new(
        category: 'COMPANY',
        distribution: [],
        source: 'TRANSACTION',
        total_amount: '0.50',
        transaction_amount: '0.50',
        type: 'SPENDBACK_PROCESSING_FEE',
        value_amount: '0.00',
        value_type: 'PERCENTAGE'
      ),
      memo: 'Order',
      note: 'Customer purchased company merchandise',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-401e7533-b973-4da6-baae-e336e540da2a',
      remaining_balance: '0.00'
    )
  ],
  transfer_type: envrr,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

## PaymentRetractionListResult

### Initialization Code

#### Example

```ruby
value = PaymentRetractionListResult.new(
  payload: [
    PaymentRetractionObject.new(
      token: 'retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50',
      amount: '2.00',
      formatted_amount: '$2.00 USD',
      client_retraction_ref: 'c0f8bdcaf7c647d0be2ecf9e1d646cc8',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:04:09.0000000Z'),
      currency: 'USD',
      source_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      destination_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      payment_token: 'pmnt-240b953b-6276-4a1b-b982-61122bde3638',
      client_payment_ref: 'c125739e6fbb471987b474fa3527dcb5',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
      quote_status: 'PENDING_ACCEPTANCE',
      transfer_type: TransferType5::RETRACTION,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/payments/pmnt-240b953b-6276-4a1b-b982-61122bde3638/retractions/retx-73d910a2-50f1-4a7f-aaa1-69cb7dc0ee50',
          method: 'GET',
          title: 'Self'
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ307',
      acceptance_mode: 'MANUAL_ACCEPT',
      allow_partial: false,
      memo: 'Customer charge dispute',
      note: 'Funds reversed to source account',
      payment_retraction_portal_id: 'FOCL1BEC8SCDNJ306',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f'
    )
  ],
  transfer_type: envrr,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

## TransferListResult

### Initialization Code

#### Example

```ruby
value = TransferListResult.new(
  payload: [
    TransferObject.new(
      token: 'xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
      client_transfer_ref: 'c23a4e8c-7f0f-47ea-b833-fc985e01051d',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:03:34.0000000Z'),
      amount: '-0.01',
      formatted_amount: '($0.01) USD',
      currency: 'USD',
      destination_token: 'user-d18a0948-292e-45cd-94f6-7bb885f62842',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      program_user_id: 'PQAPI-01866a624144f0e5f05e18de0c72d8a9',
      email: 'dyn1bec8scdnj2z4__neva_block@payquicker.testinator.com',
      quote_status: 'ACCEPTED',
      transfer_type: TransferType7::TRANSFER,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/transfers/xfer-b1080c38-a6d7-467b-b7d6-fbfe52141021',
          method: 'GET',
          title: 'Self'
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ2ZM',
      delivery_details: DeliveryDetails.new(
        expected_delivery: 'SAME_DAY'
      ),
      acceptance_mode: 'MANUAL_ACCEPT',
      fee: FeeConfiguration.new(
        category: 'COMPANY',
        distribution: [],
        source: 'TRANSACTION',
        total_amount: '0.00',
        transaction_amount: '0.00',
        type: 'BANK_TRANSFER',
        value_amount: '0.00',
        value_type: 'PERCENTAGE'
      ),
      fx_rate: FxRate.new(
        destination_amount: '-0.01',
        destination_currency: 'USD',
        destination_formatted_amount: '($0.01) USD',
        rate: '1.00',
        source_amount: '-0.01',
        source_currency: 'USD',
        source_formatted_amount: '($0.01) USD'
      ),
      memo: 'Q1 incentive transfer',
      note: 'Reissued after retraction',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-0838989a-7a5c-4e87-8466-ed1a7d31d9c0',
      lockside: 'SOURCE',
      method: 'ACCOUNT_TO_ACCOUNT_TRANSFER'
    )
  ],
  transfer_type: TransferType22::TRANSFER,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

## SpendbackRefundListResult

### Initialization Code

#### Example

```ruby
value = SpendbackRefundListResult.new(
  payload: [
    SpendbackRefundObject.new(
      token: 'rfnd-8975eb51-1baf-4549-a1d3-93f4f03d9c96',
      amount: '2.00',
      formatted_amount: '$2.00 USD',
      client_refund_ref: 'f2dfcbc1369d44268888b6590756a79a',
      created_at: DateTimeHelper.from_rfc3339('2026-05-02T23:05:48.0000000Z'),
      currency: 'USD',
      source_token: 'acct-89469bb7-daa0-4a30-8739-65e3490b3272',
      destination_token: 'user-9051a6a6-1c86-4666-8f93-79251ce7039d',
      spendback_token: 'spnd-ae020490-edc1-4f96-b584-f989685a08bc',
      program_user_id: 'PQAPI-72e774e1dc536d06b3499797eccae2aa',
      email: 'dyn1bec8scdnj2wo__alberta.purdy@payquicker.testinator.com',
      quote_status: 'PENDING_ACCEPTANCE',
      transfer_type: TransferType10::REFUND,
      links: {
        'self' => NavigationLink.new(
          href: 'https://api.sandbox.payquicker.io/api/v2/spend-back/spnd-ae020490-edc1-4f96-b584-f989685a08bc/refunds/rfnd-8975eb51-1baf-4549-a1d3-93f4f03d9c96',
          method: 'GET',
          title: 'Self'
        )
      },
      portal_id: 'FOCL1BEC8SCDNJ32B',
      acceptance_mode: 'MANUAL_ACCEPT',
      memo: 'Customer return — restocking',
      note: 'Funds returned to payee wallet',
      spendback_portal_id: 'FOCL1BEC8SCDNJ32A',
      client_spendback_ref: 'ac7d1dd70ac04100b59546f31863b139',
      receipt_status: 'COMPLETE',
      receipt_token: 'rcpt-c3c60011-1b62-4267-97e8-596bd1dcaa5f'
    )
  ],
  transfer_type: envrr,
  meta: ListMetadata.new(
    page_no: 1,
    page_size: 10,
    page_count: 1,
    record_count: 2,
    timezone: 'UTC',
    language: 'en-US',
    request_ref: '20260207T231757Z-r1d65bb46d495mgjhC1BL1qvx400000004rg00000000c2uh',
    version: '2026.02.01'
  ),
  links: ListNavigationLinks.new(
    mself: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'Self'
    ),
    first: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=1&pageSize=20',
      method: 'GET',
      title: 'First Page'
    ),
    last: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=5&pageSize=20',
      method: 'GET',
      title: 'Last Page'
    ),
    mnext: NavigationLink.new(
      href: 'https://api.sandbox.payquicker.io/api/v2/payments?page=2&pageSize=20',
      method: 'GET',
      title: 'Next Page'
    )
  )
)
```

