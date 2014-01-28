module Opener
  module BuildTools
    ##
    # Module that contains various helper methods for dealing with Python, Pip
    # and other Python tools.
    #
    module Python
      module_function

      ##
      # Returns a String containing the Python version. This only includes the
      # numerical value, the prefix "Python " is not included.
      #
      # @return [String]
      #
      def python_version
        return `python --version 2>&1`.split(/([\d\.]+)/)[1]
      end

      ##
      # Returns a String containing the Pip version in a RubyGems compatible
      # format.
      #
      # @return [String]
      #
      def pip_version
        return `pip --version 2>&1`.match(/pip\s+([\d\.]+)/)[1].chomp('.')
      end

      ##
      # Installs the packages in the requirements file in a specific directory.
      #
      # @param [String] file The requirements file to use.
      # @param [String] target The target directory to install packages in.
      #
      def pip_install(file, target)
        Rake::FileUtilsExt.sh(
          "pip install --requirement=#{file} --target=#{target} " \
            "--ignore-installed"
        )
      end

      ##
      # Installs a set of Python packages in a given directory based on a
      # requirements file. If the directory is not empty this process is
      # aborted.
      #
      # @param [String] file The requirements file to install.
      # @param [String] directory The name of the directory to install the
      #  packages into.
      #
      def install_python_packages(requirements, directory)
        return unless directory_contents(directory).empty?

        pip_install(requirements, directory)
      end
    end # Python
  end # BuildTools
end # Opener
