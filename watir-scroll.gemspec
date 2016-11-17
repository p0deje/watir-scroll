# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "watir-scroll"
  spec.version       = "0.3.0"
  spec.authors       = "Alex Rodionov"
  spec.email         = "p0deje@gmail.com"
  spec.description   = "Scrolling API for Watir"
  spec.summary       = "Scrolling API for Watir"
  spec.homepage      = "https://github.com/p0deje/watir-scroll"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "watir", ">= 6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
