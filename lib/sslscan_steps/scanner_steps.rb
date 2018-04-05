require 'sslscan_wrapper'

Given /^the target host for sslscan is (\S+)$/ do |hostname|
  @sslscan_host = hostname
end

Given /^the target port for sslscan is (\d+)$/ do |port|
  @sslscan_port = port
end

Given /^the option flag (\S+) for sslscan is set$/ do |flag|
  @sslscan_flags ||= []
  @sslscan_flags << flag
end

Given /^the option parameter (\S+) for sslscan is set to (.*)$/ do |option,value|
  @sslscan_options ||= {}
  @sslscan_options[option] = value
end

When /^the sslscan is executed/ do
  scanner = SslscanWrapper::Scanner.new
  @sslscan_options.to_h.each do |k,v|
    scanner.send("#{k}=", v)
  end
  @sslscan_flags.to_a.each do |flag|
    scanner.send("#{flag}=", true)
  end
  @sslscan_report = scanner.scan(@sslscan_host, @sslscan_port)
end

