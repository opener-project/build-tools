require_relative 'build-tools/version'

module Opener
  ##
  # Module that provides various methods that ease the process of building
  # packages. It's similar to various parts of mkmf (e.g. `find_executable`
  # from mkmf) but a lot more basic and without leaking global variables.
  #
  # All the methods in this module should be made available as module
  # functions. This allows you to use them with either the receiver or by
  # including it. See the following URL for more information:
  # <http://ruby-doc.org/core-2.0/Module.html#method-i-module_function>
  #
  module BuildTools
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
    # Checks if the version specified in `current` is greater than or equal to
    # the version specified in `requirement`.
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
      return Gem::Version.new(left) >= Gem::Version.new(right)
    end

    ##
    # Returns a String containing the Python version. This only includes the
    # numerical value, the prefix "Python " is not included.
    #
    # @return [String]
    #
    def python_version
      return `python --version 2>&1`.split(/\s/)[1]
    end
  end # BuildTools
end # Opener
