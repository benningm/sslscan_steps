spec = Gem::Specification.new do |s| 
  s.name = 'sslscan_steps'
  s.version = '0.0.1'
  s.author = 'Markus Benning'
  s.email = 'ich@markusbenning.de'
  s.homepage = 'https://github.com/benningm/sslscan_steps'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Cucumber step file definitions for sslscan'
  s.license = 'MIT'
  s.files = Dir.glob('lib/**/*.rb') + Dir.glob('bin/*') + Dir.glob('[A-Z]*') + Dir.glob('test/**/*')
  s.require_paths << 'lib'
  s.add_development_dependency('aruba', '~> 0')
  s.add_development_dependency('rake', '~> 12')
  s.add_development_dependency('rdoc', '~> 6')
  s.add_development_dependency('sslscan_wrapper', '~> 0')
end
