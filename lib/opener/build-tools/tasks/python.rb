##
# The Python Rake tasks require the following constants to be defined:
#
# * PRE_BUILD_REQUIREMENTS: pip requirements to be installed before building
#   the Gem.
# * PRE_INSTALL_REQUIREMENTS: pip requirements to be installed upon Gem
#   installation.
# * PYTHON_SITE_PACKAGES: path to the local site-packages directory, only used
#   by the `python_packages` task.
#

namespace :python do
  desc 'Installs Python packages in core/site-packages'
  task :compile => :requirements do
    requirements = {
      PRE_BUILD_REQUIREMENTS   => 'pre_build',
      PRE_INSTALL_REQUIREMENTS => 'pre_install'
    }

    requirements.each do |file, directory|
      path = File.join(PYTHON_SITE_PACKAGES, directory)

      Opener::BuildTools::Python.install_python_packages(file, path)
    end
  end

  namespace :clean do
    desc 'Removes built Python packages'
    task :packages do
      each_file(PYTHON_SITE_PACKAGES) do |group|
        each_file(group) do |directory|
          sh("rm -rf #{directory}")
        end
      end
    end

    desc 'Removes Python bytecode files'
    task :bytecode do
      sh('find . -name "*.pyc" -delete')
      sh('find . -name "*.pyo" -delete')
    end
  end
end
