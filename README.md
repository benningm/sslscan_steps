[![Gem Version](https://badge.fury.io/rb/sslscan_steps.svg)](https://badge.fury.io/rb/sslscan_steps)

# sslscan\_steps

sslscan\_steps provides cucumber step definitions for executing
SSL/TLS protocol scans with the sslscan tool.

 * [rbsec/sslscan at GitHub](https://github.com/rbsec/sslscan)

It uses the sslscan\_wrapper gem for interaction with sslscan.

## Usage

In your Gemfile:

```ruby
gem 'sslscan_steps'
```

In your support/env.rb:

```ruby
require 'sslscan_steps'
```

Use the steps in your feature files:

```gherkin
Feature: SSL/TLS protocol parameters
  To be a responsible site operator my website must support
  state-of-the-art encryption protocols.

  Scenario: Host must support strong encryption
    Given the target host for sslscan is markusbenning.de
    And the target port for sslscan is 443
    When the sslscan is executed
    Then the scanned hostname is markusbenning.de
    Then the scanned host certificate signature algorithm is sha256WithRSAEncryption
    Then the scanned host certificate is not self-signed
    Then the scanned host certificate is not expired
    Then the scanned host is not vulnerable to heartbleed
    Then the scanned host must support the cipher ECDHE-RSA-AES128-GCM-SHA256
    Then the scanned host must support sslversion TLSv1.2
```

## More Examples

See [features/](tree/master/features).
