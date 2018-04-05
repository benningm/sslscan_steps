require 'rake/clean'
require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'                                                                       

spec = eval(File.read('sslscan_steps.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
end

Rake::RDocTask.new do |rd|
  rd.rdoc_files.include("lib/**/*.rb","bin/**/*")
  rd.title = 'Cucumber step definitions for sslscan'
end                                                                                       

