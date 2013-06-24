module Opener
  module BuildTools
    ##
    # Module that provides helper methods for dealing with Perl specific
    # projects.
    #
    module Perl
      module_function

      ##
      # Checks if a given Perl module is installed using `perldoc`. Note that
      # due to the use of `perldoc` this requires the module to have at least
      # some documentation. However, most Perl modules available on cpan have
      # documentation one way or another so this shouldn't be a problem.
      #
      # If the module can not be found the current script is terminated.
      #
      # @param [String] name The full name of the Perl module.
      #
      def require_perl_module(name)
        print "Checking for Perl module #{name}..."

        path = `perldoc -l #{name} 2>&1`

        if File.file?(path)
          puts 'yes'
        else
          abort 'no'
        end
      end

      ##
      # Returns a String containing the Perl version in a RubyGems comparible
      # format.
      #
      # @return [String]
      #
      def perl_version
        `perl --version 2>&1`.match(/\(v([\d\.]+)\)/)[1]
      end
    end # Perl
  end # BuildTools
end # Opener
