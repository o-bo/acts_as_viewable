$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_viewable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_viewable"
  s.version     = ActsAsViewable::VERSION
  s.authors     = ["o-bo"]
  s.email       = ["olivier@kasual.biz"]
  s.homepage    = ""
  s.summary     = "Add an act_as_viewable feature to a model that stores the number of views (ie. GET calls on the resource)."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2"

  s.add_development_dependency "sqlite3"
end
