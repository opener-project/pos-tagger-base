require File.expand_path('../lib/VU-pos-tagger-opennlp_NL_kernel', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = "VU-pos-tagger-opennlp_NL_kernel"
  gem.version     = Opener::Kernel::VU::POSTagger::OpenNLP::NL::VERSION
  gem.authors     = ['development@olery.com']
  gem.summary     = 'POS tagger for Dutch and German using OpenNLP'
  gem.description = gem.summary
  gem.homepage    = "http://opener-project.github.com/"

  gem.files       = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})

  gem.add_dependency 'opener-build-tools'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'cucumber'
  gem.add_development_dependency 'rake'
end
