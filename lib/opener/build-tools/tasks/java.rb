##
# The Java Rake tasks require the following constant to be defined:
#
# * CORE_DIRECTORY: path containing the Java source code.
#

namespace :java do
  desc 'Installs Java packages in core/'
  task :compile do
    Dir.chdir(CORE_DIRECTORY) do
      sh "mvn package"
    end
  end

  namespace :clean do
    desc 'Removes built Java packages'
    task :packages do
      Dir.chdir(CORE_DIRECTORY) do
        sh 'mvn clean'
      end
    end
  end
end
