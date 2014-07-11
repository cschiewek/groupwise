# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'groupwise/version'

Gem::Specification.new do |spec|
  spec.name          = "groupwise"
  spec.version       = Groupwise::VERSION
  spec.authors       = ["Curtis Schiewek"]
  spec.email         = ["curtis.schiewek@gmail.com"]
  spec.summary       = %q{Wrapper for Groupwise SOAP web services.}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "savon", "~> 2.6.0", ">= 2.6.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.3.2", ">= 10.3.2"
  spec.add_development_dependency "rspec", "~> 3.0.0", ">= 3.0.0"
  spec.add_development_dependency "debugger", "~> 1.6.8", ">= 1.6.8"
end
