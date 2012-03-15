# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dependancy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Aaron Tian']
  gem.email         = ['Aaron2Ti@gmail.com']
  gem.description   = %q{Getters & setters for dependency injection}
  gem.summary       = %q{Java style getters & setters with default values}
  gem.homepage      = 'https://github.com/Aaron2Ti/dependancy'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'dependancy'
  gem.require_paths = ['lib']
  gem.version       = Dependancy::VERSION

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'ruby-debug19'
end
