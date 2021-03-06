# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake_report/version'

Gem::Specification.new do |spec|
  spec.name          = "rake_report"
  spec.version       = RakeReport::VERSION
  spec.authors       = ["Steve Adams"]
  spec.email         = ["steve.adams@optimizely.com"]

  spec.summary       = %q{Generate timing reports for rake tasks.}
  spec.homepage      = "https://github.com/optimizely/rake_report"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3.0"
  spec.add_development_dependency "json-schema", "~> 2.5.1"
end
