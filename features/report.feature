Feature: Parse and test sslscan reports
  When i use sslscan_steps i must be able to parse and test
  sslscan reports.

  All data contained in a sslscan report should be testable.

  Background:
    Given the sslscan report file is features/test-data/report.xml
    When the sslscan report is read from the file

  Scenario: Load and parse an report file
    Then the scanned hostname is localhost
    Then the scanned port is 4433
    Then the scanned host supports no compression
    Then the scanned host supports renegotiation
    Then the scanned host supports secure renegotiation
    Then the scanned host certificate signature algorithm is sha256WithRSAEncryption
    Then the scanned host certificate subject is /C=DE/ST=Bavaria/L=test/O=Default Company Ltd/CN=test.bla
    Then the scanned host certificate subject altnames are empty
    Then the scanned host certificate issuer is /C=DE/ST=Bavaria/L=test/O=Default Company Ltd/CN=test.bla
    Then the scanned host certificate is self-signed
    Then the scanned host certificate is not expired
    Then the scanned host is not vulnerable to heartbleed

  Scenario Outline: The host must support strong ciphers
    Then the scanned host must support the cipher <cipher>

    Examples:
      | cipher |
      | AES256-SHA256 |
      | AES256-GCM-SHA384 |

  Scenario Outline: The host must support Diffie Hellman ciphers
    Then the scanned host must support the cipher <cipher>

    Examples:
      | cipher |
      | DHE-RSA-AES256-GCM-SHA384 |
      | DHE-RSA-AES256-SHA256 |

  Scenario Outline: The host must support Elliptic Curve ciphers
    Then the scanned host must support the cipher <cipher>

    Examples:
      | cipher |
      | ECDHE-RSA-AES256-SHA384 |
      | ECDHE-RSA-AES256-GCM-SHA384 |

  Scenario Outline: The host must NOT support null ciphers
    Then the scanned host must not support ciphers like <regex>

    Examples:
      | regex |
      | NULL |
      | ^ADH |

  Scenario Outline: The host must NOT support weak ciphers
    Then the scanned host must not support ciphers like <regex>

    Examples:
      | regex |
      | MD5 |
      | RC4 |

  Scenario Outline: The host must support current TLS versions
    Then the scanned host must support sslversion <sslversion>

    Examples:
      | sslversion |
      | TLSv1.0 |
      | TLSv1.1 |
      | TLSv1.2 |

  Scenario Outline: The host must NOT support old SSL/TLS versions
    Then the scanned host must not support sslversion <sslversion>

    Examples:
      | sslversion |
      | SSLv2 |
      | SSLv3 |
