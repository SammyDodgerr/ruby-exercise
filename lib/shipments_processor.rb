require "pathname"

class ShipmentsProcessor
  # @param filepath String - relative path to the shipments file to process
  def initialize(filepath:)
    @filepath = filepath
  end

  # Read the file at the given filepath
  # @todo Implement required tasks in README
  # @note `Dir.pwd` will be where the command (ie. rake task or test command) is run from - not the path to this file
  def call
    path = File.join(Dir.pwd, @filepath)

    file = File.open(path, "r")
    file.read
  ensure
    file&.close
  end
end
