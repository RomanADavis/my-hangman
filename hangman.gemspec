# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hangman/version'

Gem::Specification.new do |spec|
  spec.name          = "hangman"
  spec.version       = Hangman::VERSION
  spec.authors       = ["Roman A. Davis"]
  spec.email         = ["fluffyribbit@gmail.com"]
  spec.summary       = "Simple OOP Hangman Game. With specs."
  spec.description   = %q{For the Odin Project}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
