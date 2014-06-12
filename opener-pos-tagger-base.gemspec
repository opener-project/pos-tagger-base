require File.expand_path('../lib/opener/pos_taggers/base/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'opener-pos-tagger-base'
  gem.version     = Opener::POSTaggers::Base::VERSION
  gem.authors     = ['development@olery.com']
  gem.summary     = 'POS tagger for Dutch and German using OpenNLP'
  gem.description = gem.summary
  gem.homepage    = 'http://opener-project.github.com/'
  gem.extensions  = ['ext/hack/Rakefile']

  gem.required_ruby_version = '>= 1.9.2'

  gem.files = Dir.glob([
    'core/**/*',
    'ext/**/*',
    'lib/**/*',
    '*.gemspec',
    '*_requirements.txt',
    'README.md'
  ]).select { |file| File.file?(file) }

  gem.executables = Dir.glob('bin/*').map { |file| File.basename(file) }

  gem.add_dependency 'opener-build-tools', ['>= 0.2.7']
  gem.add_dependency 'rake'

  gem.add_development_dependency 'rspec', '~> 3.0'
  gem.add_development_dependency 'cucumber'
end
