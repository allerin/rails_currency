# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_currency/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_currency"
  spec.version       = RailsCurrency::VERSION
  spec.authors       = ["Anand Bait"]
  spec.email         = ["anand.bait@allerin.com"]
  spec.summary       = %q{A Ruby gem to real time convert among different currencies}
  spec.description   = %q{A Ruby gem to real time convert among different currencies with services from xe.com and google.com}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'hpricot'
end
