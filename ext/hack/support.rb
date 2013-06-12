require 'opener/build-tools'

include Opener::BuildTools::Requirements
include Opener::BuildTools::Python
include Opener::BuildTools::Files

# Directory where packages will be installed to.
PYTHON_SITE_PACKAGES = File.expand_path(
  '../../../core/site-packages',
  __FILE__
)

# Directory containing the temporary files.
TMP_DIRECTORY = File.expand_path('../../../tmp', __FILE__)

# Path to the pip requirements file used to install requirements before
# packaging the Gem.
PRE_BUILD_REQUIREMENTS = File.expand_path(
  '../../../pre_build_requirements.txt',
  __FILE__
)

# Path to the pip requirements file used to install requirements upon Gem
# installation.
PRE_INSTALL_REQUIREMENTS = File.expand_path(
  '../../../pre_install_requirements.txt',
  __FILE__
)

##
# Verifies the requirements to install thi Gem.
#
def verify_requirements
  require_executable('python')
  require_version('python', python_version, '2.7.0')
  require_executable('pip')
end

##
# Installs a set of Python packages in a given directory based on a
# requirements file. If the directory is not empty this process is aborted.
#
# @param [String] file The requirements file to install.
# @param [String] directory The name of the directory in core/site-packages to
#  install the packages in to.
#
def install_python_packages(requirements, directory)
  path = File.join(PYTHON_SITE_PACKAGES, directory)

  return unless directory_contents(path).empty?

  pip_install(requirements, path)
end
