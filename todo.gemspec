# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "todo-cli"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tobiasz Walczak"]
  s.email       = ["tobiaszwalczak@gmail.com"]
  s.homepage    = "http://github.com/tobiaszwalczak/Todo-CLI/"
  s.summary     = %q{TODO: A little command line todo app.}
  s.description = %q{TODO: Todo-CLI is a little command line app written in ruby which, creates a TODO file in your working directory and also populates it.}
  s.license       = "MIT"

  s.add_runtime_dependency "rainbow"
  s.add_development_dependency "rspec"

  s.files         = Dir["lib/*.rb"] + Dir["lib/todo/.rb"] + Dir["bin/*"]
  s.executables   = ["todo"]
  s.require_paths = ["lib"]
end