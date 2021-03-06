$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "carrierwave_instrumentation/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "carrierwave_instrumentation"
  s.version     = CarrierWaveInstrumentation::VERSION
  s.authors     = ["Bradford Folkens"]
  s.email       = ["bfolkens@gmail.com"]
  s.homepage    = "http://github.com/bfolkens/carrierwave_instrumentation"
  s.summary     = "ActiveSupport Instrumentation outlets for Carrierwave"
  s.description = "WIP - will add more endpoints (PR welcome :)"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "active_support", "> 3.0"
  s.add_dependency "carrierwave", "> 0.6.1"
	s.add_dependency "loofah", "~> 2.2.1"
	s.add_dependency "nokogiri", "~> 1.8.1"

  s.add_development_dependency "sqlite3"
end
