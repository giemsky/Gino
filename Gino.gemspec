# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "Gino/version"

Gem::Specification.new do |s|
  s.name        = "Gino"
  s.version     = Gino::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Grzegorz Miklaszewski"]
  s.email       = ["mail@gmiklaszewski.pl"]
  s.homepage    = ""
  s.summary     = %q{Gem for tracking git changes by user}
  s.description = %q{}

  s.rubyforge_project = "Gino"

  s.add_development_dependency('rake')  
  s.add_development_dependency('test-unit')

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
