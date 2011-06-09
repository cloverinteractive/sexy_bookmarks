Gem::Specification.new do |gem|
	gem.name 	            = "sexy_bookmarks"
	gem.version           = "0.2.0"
	gem.authors           = [ "Enrique Vidal", "Michael Baldry"]
	gem.email	            = "enrique@cloverinteractive.com"
	gem.homepage          = "http://github.com/michaelbaldry/sexy_bookmarks"
	gem.summary           = "An easy to use rails port of sexybookmarks, upgraded to work with rails 3"
	
	gem.description       = "SexyBookmarks is only a rails port of wordpress popular plugin sexy bookmarks."
	
	gem.files             = Dir[ "lib/**/*.rb", "[A-Z]*", "init.rb",  "sexy_bookmarks.gemspec", "lib/fixtures/*.yml", "lib/sexybookmarks/*/*/*/*" ]
	gem.test_files        = Dir[ "test/**/*" ]
	gem.require_path      = "lib"
	
	gem.extra_rdoc_files  = Dir[ "*.rdoc" ]
	gem.rdoc_options      = ["--charset=UTF-8", "--exclude=lib/sexy_bookmarks/assets"]
end