require 'sslscan_wrapper'

Given /^the sslscan report file is (.*)$/ do |path|
  @sslscan_filename = path
end

When /^the sslscan report is read from the file$/ do
  content = File.read(@sslscan_filename)
  @sslscan_report = SslscanWrapper::Report.new(content)
  expect(@sslscan_report).to be_a(SslscanWrapper::Report)
end

Then /^the scanned hostname is (.*)$/ do |hostname|
  expect(@sslscan_report.host).to eq(hostname)
end

Then /^the scanned port is (\d+)$/ do |port|
  expect(@sslscan_report.port.to_i).to eq(port.to_i)
end

Then /^the scanned host supports (no )?compression$/ do |negate|
  expect(@sslscan_report.compression_supported?).to eq(negate.nil? ? true : false)
end

Then /^the scanned host supports (no )?renegotiation$/ do |negate|
  expect(@sslscan_report.renegotiation_supported?).to eq(negate.nil? ? true : false)
end

Then /^the scanned host supports (no )?secure renegotiation$/ do |negate|
  expect(@sslscan_report.renegotiation_secure?).to eq(negate.nil? ? true : false)
end

Then /^the scanned host certificate signature algorithm is (.*)$/ do |alg|
  expect(@sslscan_report.signature_algorithm).to eq(alg)
end

Then /^the scanned host certificate subject is (.*)$/ do |subject|
  expect(@sslscan_report.subject).to eq(subject)
end

Then /^the scanned host certificate subject altnames are (.*)$/ do |altnames|
  altnames = nil if altnames == 'empty'
  expect(@sslscan_report.altnames).to eq(altnames)
end

Then /^the scanned host certificate issuer is (.*)$/ do |issuer|
  expect(@sslscan_report.issuer).to eq(issuer)
end

Then /^the scanned host certificate is (not )?self-signed$/ do |negate|
  expect(@sslscan_report.self_signed?).to eq(negate.nil? ? true : false)
end

Then /^the scanned host certificate is (not )?expired$/ do |negate|
  expect(@sslscan_report.expired?).to eq(negate.nil? ? true : false)
end

Then /^the scanned host is (not )?vulnerable to heartbleed$/ do |negate|
  expect(@sslscan_report.heartbleed_vulnerable?).to eq(negate.nil? ? true : false)
end

Then /^the scanned host must (|not )support the cipher (\S+)$/ do |negate,cipher|
  expect(@sslscan_report.support_cipher?(cipher)).to eq(negate =~ /not/ ? false : true)
end

Then /^the scanned host must (|not )support ciphers like (.*)$/ do |negate,regex|
  list = @sslscan_report.ciphers.select do |cipher|
    cipher.match(regex)
  end
  expect(list.count > 0).to eq(negate =~ /not/ ? false : true)
end

Then /^the scanned host must (|not )support sslversion (\S+)$/ do |negate,sslversion|
  expect(@sslscan_report.support_sslversion?(sslversion)).to eq(negate =~ /not/ ? false : true)
end
