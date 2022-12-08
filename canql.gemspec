# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'canql/version'

Gem::Specification.new do |spec|
  spec.name          = 'canql'
  spec.version       = Canql::VERSION
  spec.authors       = ['NHSD NDRS Development Team']
  spec.email         = []

  spec.summary       = 'Congenital Anomaly Natural Query Language'
  spec.description   = 'Domain Specific Language for querying PHE NCARDRS datastores'
  spec.homepage      = 'https://github.com/NHSDigital/canql'
  spec.license       = 'MIT'

  gem_files          = %w[CHANGELOG.md CODE_OF_CONDUCT.md LICENSE.txt README.md Rakefile
                          app config db lib]
  spec.files         = `git ls-files -z`.split("\x0").
                       select { |f| gem_files.include?(f.split('/')[0]) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.7'

  spec.add_dependency 'chronic', '~> 0.3'
  spec.add_dependency 'ndr_support', '>= 3.0', '< 6'
  spec.add_dependency 'rails', '>= 6.0', '< 7.1'
  spec.add_dependency 'treetop', '>= 1.4.10'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-minitest'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'minitest', '>= 5.0.0'
  spec.add_development_dependency 'ndr_dev_support', '>= 6.0', '< 8.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'terminal-notifier-guard' if RUBY_PLATFORM =~ /darwin/
end
