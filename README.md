# Build Tools

**NOTE:** This repository is deprecated as most of its functionality has been
moved to repository specific Rake tasks.

The OpeNER build tools is a Gem that contains a collection of helper methods
and Rake tasks that ease the process of wrapping and distributing the various
OpeNER Gems.

## Requirements

* Ruby 1.9.2 or newer
* Rake

## Usage

Rake tasks can be loaded as any other normal Ruby file:

    require 'opener/build-tools/tasks/python'

The build tools also come with various helper modules such as
`Opener::BuildTools::Python`. The methods in these modules can be accessed
either by using the full namespace (e.g.
`Opener::BuildTools::Python.python_version`) or by including the modules into a
certain scope.

Using the full namespace:

    Opener::BuildTools::Python.python_version # => "2.7.5"

Including the module:

    include Opener::BuildTools::Python

    python_version # => "2.7.5"
