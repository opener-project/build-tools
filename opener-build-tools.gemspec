require File.expand_path('../lib/opener/build-tools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'opener-build-tools'
  gem.version     = Opener::BuildTools::VERSION
  gem.authors     = ['development@olery.com']
  gem.summary     = 'Various build tools for OpeNER projects.'
  gem.description = gem.summary
  gem.homepage    = 'http://opener-project.github.com'
  gem.license     = 'Apache 2.0'

  gem.required_ruby_version = '>= 1.9.2'

  gem.files = Dir.glob([
    'lib/**/*.*',
    '*.gemspec',
    'README.md'
  ])

  gem.add_dependency 'rake'
end
