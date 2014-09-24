# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'renote/version'

Gem::Specification.new do |s|
  s.name          = 'renote'
  s.version       = Renote::VERSION
  s.authors       = ['Nick Kaye']
  s.email         = ['nick.c.kaye@gmail.com']
  s.summary       = %q{Renote is a CLI for discreet note-taking.}
  s.description   = %q{Use Renote in order to take notes discreetly.}
  s.homepage      = 'https://github.com/outrightmental/renote'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.6'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'coveralls', '~> 0.7'
  s.add_development_dependency 'rspec', '~> 3.1'
  s.add_dependency 'thor', '~> 0.19'
end
