# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sproxy/version'

Gem::Specification.new do |spec|
  spec.name          = "sproxy"
  spec.version       = Sproxy::VERSION
  spec.authors       = ["Maxim Andryunin"]
  spec.email         = ["maxim.andryunin@gmail.com"]
  spec.description   = %q{Simple network connection proxying}
  spec.summary       = %q{Proxying network connection using EventMachine}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_dependency 'eventmachine', '~> 1.0.3'
  spec.add_dependency 'thor', '~> 0.19.1'
end
