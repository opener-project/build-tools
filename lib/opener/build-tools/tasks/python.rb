##
# The Python Rake tasks require the following constants to be defined:
#
# * PRE_BUILD_REQUIREMENTS
# * PRE_INSTALL_REQUIREMENTS
#
# Both of these constants should point to pip requirements files.
#

namespace :python do
  desc 'Installs Python packages in core/site-packages'
  task :compile => :requirements do
    requirements = {
      PRE_BUILD_REQUIREMENTS   => 'pre_build',
      PRE_INSTALL_REQUIREMENTS => 'pre_install'
    }

    requirements.each do |file, directory|
      install_python_packages(file, directory)
    end
  end
end
