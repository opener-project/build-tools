module Opener
  module BuildTools
    ##
    # Module that provides various helper methods for ensuring certain
    # executables exist, version requirements are met and so on.
    #
    module Requirements
      module_function

      ##
      # Checks if a given executable can be found in $PATH and aborts if this
      # isn't the case.
      #
      # @example
      #  require_executable('python')
      #
      # @param [String] name
      #
      def require_executable(name)
        print "Checking for #{name}... "

        exists = false

        ENV['PATH'].split(File::PATH_SEPARATOR).each do |directory|
          path = File.join(directory, name)

          if File.executable?(path)
            exists = true
            break
          end
        end

        if exists
          puts 'yes'
        else
          abort 'no'
        end
      end

      ##
      # Checks if the version specified in `current` is greater than or equal
      # to the version specified in `requirement`.
      #
      # @example Ensures that Python's version is >= 2.7.0
      #  require_version('python', '2.7.5', '2.7.0')
      #
      # @param [String] name The name of the executable.
      # @param [String] current The current version.
      # @param [String] required The minimum required version.
      #
      def require_version(name, current, required)
        print "Checking for #{name} >= #{required}... "

        if version_greater_than(current, required)
          puts 'yes'
        else
          abort 'no'
        end
      end

      ##
      # Checks if the version string to the left is greater or equal to the
      # version string on the right.
      #
      # @param [String] left
      # @param [String] right
      # @return [TrueClass|FalseClass]
      #
      def version_greater_than(left, right)
	print "mierieireire"
        return Gem::Version.new(left) >= Gem::Version.new(right)
      end
    end # Requirements
  end # BuildTools
end # Opener
