require 'opener/build-tools'

# Directory where Python packages will be installed.
PYTHON_VENDOR = File.expand_path('../../../core/vendor', __FILE__)

# Directory where packages will be installed to.
PYTHON_SITE_PACKAGES = File.expand_path('../../../core/site-packages', __FILE__)

# Directory containing the temporary files.
TMP_DIRECTORY = File.expand_path('../../../tmp', __FILE__)

# Array containing all the generated files that should be stored in the Gem.
#GENERATED_FILES = Dir.glob(File.join(PYTHON_VENDOR, 'lxm*'))

##
# Installs the packages in the requirements file in the local site-packages
# directory.
#
# @param [String] file The requirements file to use.
#
def pip_install(file)
  sh("pip install --requirement=#{file} --target=#{PYTHON_SITE_PACKAGES}")
end

include Opener::BuildTools
