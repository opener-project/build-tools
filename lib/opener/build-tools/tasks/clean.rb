##
# These Rake tasks require the following constants to be predefined:
#
# * TMP_DIRECTORY: path to the local tmp/ directory
# * PYTHON_SITE_PACKAGES: path to the local site-packages directory, only used
#   by the `python_packages` task.
#

namespace :clean do
  desc 'Removes Python .pyc files'
  task :pyc do
    sh('find . -name "*.pyc" -delete')
    sh('find . -name "*.pyo" -delete')
  end

  desc 'Removes tmp files'
  task :tmp do
    sh("rm -f #{File.join(TMP_DIRECTORY, '*.kaf')}")
  end

  desc 'Removes Python packages from core/site-packages'
  task :python_packages do
    each_file(PYTHON_SITE_PACKAGES) do |group|
      each_file(group) do |directory|
        sh("rm -rf #{directory}")
      end
    end
  end

  desc 'Removes all built Gem files'
  task :gems do
    sh('rm -f pkg/*.gem')
  end
end
