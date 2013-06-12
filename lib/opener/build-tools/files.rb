module Opener
  module BuildTools
    ##
    # Module that contains various helper methods that makes it easier to work
    # with collections of files and iterate over them.
    #
    module Files
      module_function

      ##
      # Returns an Array containing the contents of a given directory,
      # excluding '.' and '..'.
      #
      # @param [String] directory
      #
      def directory_contents(directory)
        return Dir.glob(File.join(directory, '*'))
      end

      ##
      # Calls the supplied block for each file in the given directory, ignoring
      # '.' and '..'.
      #
      # @param [String] directory
      # @yield [String]
      #
      def each_file(directory)
        directory_contents(directory).each do |path|
          yield path
        end
      end
    end # Files
  end # BuildTools
end # Opener
