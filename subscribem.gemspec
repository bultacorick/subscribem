$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscribem/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscribem"
  s.version     = Subscribem::VERSION
  s.authors     = ["bultaco rick"]
  s.email       = ["bultaco.rick@gmail.com"]
  s.homepage    = "http://localhost"
  s.summary     = "Summary of Subscribem."
  s.description = "Description of Subscribem."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'bcrypt-ruby', '3.0.1'
  s.add_dependency 'warden', '1.2.3'
  s.add_dependency 'dynamic_form', '1.1.4'
  
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '2.14.0'
  s.add_development_dependency 'capybara', '2.1.0'
end
