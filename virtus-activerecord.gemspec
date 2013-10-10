# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'virtus/active_record/version'

Gem::Specification.new do |spec|
  spec.name          = "virtus-activerecord"
  spec.version       = Virtus::ActiveRecord::VERSION
  spec.authors       = ["Craig Buchek"]
  spec.email         = ["craig@boochtek.com"]
  spec.description   = %q{Use Virtus to define ActiveRecord model attributes}
  spec.summary       = %q{Define attributes for ActiveRecord models within the model classes, using Virtus.}
  spec.homepage      = "https://github.com/boochtek/virtus-activerecord"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency('virtus', '~> 1.0.0.rc2')
  spec.add_runtime_dependency('activerecord', '~> 4.0.0')

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
