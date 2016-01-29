# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-itamae-command/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-itamae-command"
  spec.version       = Vagrant::ItamaeCommand::VERSION
  spec.authors       = ["gendosu"]
  spec.email         = ["gendosu@gmail.com"]
  spec.summary       = %q{Vagrant plugin for itamae command}
  spec.description   = %q{Vagrant plugin for itamae command}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'itamae', '~> 1.0', '>= 1.0.8'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
end
