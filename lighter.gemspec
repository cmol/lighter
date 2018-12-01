# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lighter/version'

Gem::Specification.new do |spec|
  spec.name          = "lighter"
  spec.version       = Lighter::VERSION
  spec.authors       = ["Claus Lensbøl"]
  spec.email         = ["cmol@cmol.dk"]
  spec.summary       = %q{Library for interacting with API}
  spec.description   = %q{The Ligher API is made for interacting with an RGB
lighting system}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Dependencies
  spec.add_runtime_dependency "serialport"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
