# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'array_utils/version'

Gem::Specification.new do |spec|
  spec.name          = "array_utils"
  spec.version       = ArrayUtils::VERSION
  spec.authors       = ["Mitch Crowe"]
  spec.email         = ["crowe.mitch@gmail.com"]
  spec.description   = %q{Array utilities}
  spec.summary       = %q{Array utilties}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
