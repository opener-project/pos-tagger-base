require 'bundler/gem_tasks'
require_relative 'ext/hack/support'

desc 'Verifies the requirements'
task :requirements do
  require_executable('python')
  require_version('python', python_version, '2.7.0')
  require_executable('pip')
end

desc 'Installs Python packages in core/site-packages'
task :compile => :requirements do
  requirements = [
    File.expand_path('../pre_build_requirements.txt', __FILE__),
    File.expand_path('../pre_install_requirements.txt', __FILE__)
  ]

  if Dir.glob(File.join(PYTHON_SITE_PACKAGES, '*')).empty?
    requirements.each { |file| pip_install(file) }
  else
    puts 'Packages already installed, skipping'
  end
end

desc 'Cleans up build files'
task :clean do
  sh("rm -f #{File.join(TMP_DIRECTORY, '*.kaf')}")

  Dir.glob(File.join(PYTHON_SITE_PACKAGES, '*')).each do |directory|
    sh("rm -rf #{directory}")
  end

  sh('find . -name "*.pyc" -delete')
end

desc 'Runs the tests'
task :test => :compile do
  sh('cucumber features')
end

task :default => :test
