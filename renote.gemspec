# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lib/renote/version'

Gem::Specification.new do |gspec|
  g.name          = 'renote'
  g.version       = Renote::VERSION
  g.authors       = ['Nick Kaye']
  g.email         = ['nick.c.kaye@gmail.com']
  g.summary       = %q{Renote is a CLI for discreet note-taking.}
  g.description   = %q{Use Renote in order to take notes discreetly.}
  g.homepage      = ''
  s.metadata      = { 'source_code' => "https://github.com/outrightmental/renote" }
  g.license       = 'MIT'

  g.files         = `git ls-files -z`.split("\x0")
  g.executables   = g.files.grep(%r{^bin/}) { |f| File.basename(f) }
  g.test_files    = g.files.grep(%r{^(test|spec|features)/})
  g.require_paths = ['lib']

  g.add_development_dependency 'bundler', '~> 1.6'
  g.add_development_dependency 'rake', '~> 10.0'
  g.add_dependency 'thor', '~> 0.19'
  g.add_dependency 'coveralls', '~> 0.7'
end
