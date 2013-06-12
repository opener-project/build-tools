##
# The Java Rake tasks require the following constant to be defined:
#
# * CORE_DIRECTORY: path containing the Java source code.
#

namespace :java do
  desc 'Removes all built files'
  task :clean do
    Dir.chdir(CORE_DIRECTORY) do
      sh 'mvn clean'
    end
  end

  desc 'Installs Java packages in core/'
  task :compile do
    Dir.chdir(CORE_DIRECTORY) do
      sh "mvn package"
    end
  end
end
