# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require 'sexy_bookmarks/version'

 Gem::Specification.new do |gem|
  gem.authors       = ["Enrique Vidal"]
  gem.email         = ["enrique@cloverinteractive.com"]
  gem.description   = "SexyBookmarks is a rails port of the wordpress popular plugin sexy bookmarks."
  gem.summary       = "An easy to use rails port of sexybookmarks"
  gem.homepage      = "http://cloverinteractive.github.com/sexy_bookmarks"

  gem.files         = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.md"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sexy_bookmarks"
  gem.require_paths = ["lib"]
  gem.version       = SexyBookmarks::VERSION

  gem.add_dependency 'rails'
  gem.add_dependency 'jquery-rails'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'turn'
  gem.add_development_dependency 'capybara'
  gem.add_development_dependency 'turn', '0.8.2'
end
