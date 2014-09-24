# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lib/renote/version'

Gem::Specification.new do |spec|
  spec.name          = 'renote'
  spec.version       = Renote::VERSION
  spec.authors       = ['Nick Kaye']
  spec.email         = ['nick.c.kaye@gmail.com']
  spec.summary       = %q{Renote is a CLI for discreet note-taking.}
  spec.description   = %q{Use Renote in order to take notes discreetly.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'coveralls', '~> 0.7'
end
