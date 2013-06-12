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
        return `python --version 2>&1`.split(/\s/)[1]
      end

      ##
      # Installs the packages in the requirements file in a specific directory.
      #
      # @param [String] file The requirements file to use.
      # @param [String] target The target directory to install packages in.
      #
      def pip_install(file, target)
        sh("pip install --requirement=#{file} --target=#{target}")
      end
    end # Python
  end # BuildTools
end # Opener
