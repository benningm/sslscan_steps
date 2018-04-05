Feature: Execute sslscan to scan targets
  When I use the sslscan_steps i must be able to execute a
  sslscan on a target.

  Scenario: Execute a sslscan protocol scan
    Given the target host for sslscan is markusbenning.de
    And the target port for sslscan is 443
    When the sslscan is executed
    Then the scanned hostname is markusbenning.de

  Scenario: Execute a sslscan with options
    Given the target host for sslscan is markusbenning.de
    And the target port for sslscan is 443
    And the option flag ipv4 for sslscan is set
    And the option parameter sni_name for sslscan is set to unknown
    When the sslscan is executed
    Then the scanned hostname is markusbenning.de

