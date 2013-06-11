require 'bundler/gem_tasks'
require_relative 'ext/hack/support'

desc 'Verifies the requirements'
task :requirements do
  require_executable('python')
  require_version('python', python_version, '2.7.0')
  require_executable('pip')
end

desc 'Updates all the submodules'
task :update_submodules do
  sh('git submodule foreach git pull origin master')
end

desc 'Sets up the base structure of the project'
task :setup => [:requirements] do
  requirements = [
    File.expand_path('../pre_build_requirements.txt', __FILE__),
    File.expand_path('../pre_install_requirements.txt', __FILE__)
  ]

  requirements.each do |file|
    pip_install(file)
  end
end

desc 'Compiles/installs Python packages locally'
task :compile => :requirements do

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
task :test do
  sh('cucumber features')
end
