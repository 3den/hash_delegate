# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hash_delegate/version'

Gem::Specification.new do |spec|
  spec.name          = "hash_delegate"
  spec.version       = HashDelegate::VERSION
  spec.authors       = ["Marcelo Eden"]
  spec.email         = ["edendroid@gmail.com"]
  spec.description   = %q{Add accessor methods that delegate to key/values of a hash attribute.}
  spec.summary       = %q{Add accessor methods that delegate to key/values of a hash attribute.}
  spec.homepage      = "https://github.com/3den/hash_delegate"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.0.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
