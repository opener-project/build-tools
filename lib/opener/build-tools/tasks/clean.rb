##
# These Rake tasks require the following constants to be predefined:
#
# * TMP_DIRECTORY: path to the local tmp/ directory
#

namespace :clean do
  desc 'Removes tmp files'
  task :tmp do
    sh("rm -f #{File.join(TMP_DIRECTORY, '*.kaf')}")
  end

  desc 'Removes all built Gem files'
  task :gems do
    sh('rm -f pkg/*.gem')
  end
end
