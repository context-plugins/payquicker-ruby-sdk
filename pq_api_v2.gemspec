Gem::Specification.new do |s|
  s.name = 'pq_api_v2'
  s.version = '2026.2.1'
  s.summary = 'pq_api_v2'
  s.description = 'PayQuicker offers a secure and instant payout platform that delivers payment to a payee-owned and insured bank account linked to a debit card, similar to a standard checking account.  As soon as the payment is made, funds are available in the insured account and available to spend instantly online through a virtual card, at retail with a plastic prepaid debit card, or by loading the card to a mobile wallet.  PayQuicker provides a RESTful API that allows authorized clients to send and receive payments, debit user\'s accounts for spendback, retrieve user account balance, retrieve user reports, and retrieve transaction reports.'
  s.authors = ['PayQuicker Support']
  s.email = ['support@payquicker.com']
  s.homepage = 'https://www.payquicker.com'
  s.licenses = ['MIT']
  s.add_dependency('apimatic_core_interfaces', '~> 0.2.3')
  s.add_dependency('apimatic_core', '~> 0.3.20')
  s.add_dependency('apimatic_faraday_client_adapter', '~> 0.1.6')
  s.required_ruby_version = ['>= 2.6']
  s.files = Dir['{bin,lib,man,test,spec}/**/*', 'README*', 'LICENSE*']
  s.require_paths = ['lib']
end
