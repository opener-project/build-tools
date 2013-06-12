module Opener
  module BuildTools
    ##
    # Module that provides helper methods for dealing with Java specific
    # projects.
    #
    module Java
      module_function

      ##
      # Returns a String containing the Java version in a RubyGems compatible
      # format.
      #
      # @return [String]
      #
      def java_version
        return `java -version 2>&1`.match(/java\s+version\s+"([\d\.]+)_/)[1]
      end
    end # Java
  end # BuildTools
end # Opener
