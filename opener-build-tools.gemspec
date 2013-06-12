require File.expand_path('../lib/opener/build-tools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'opener-build-tools'
  gem.version     = Opener::BuildTools::VERSION
  gem.authors     = ['development@olery.com']
  gem.summary     = 'Various build tools for OpeNER projects.'
  gem.description = gem.summary
  gem.homepage    = 'http://opener-project.github.com'

  gem.files = `git ls-files`.split("\n")

  gem.add_development_dependency 'rake'
end
