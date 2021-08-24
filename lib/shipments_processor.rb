require "pathname"
require 'json'

class ShipmentsProcessor
  # @param filepath String - relative path to the shipments file to process
  def initialize(filepath: "spec/fixtures/shipments.json")
    @filepath = filepath
  end

  # Read the file at the given filepath
  # @todo Implement required tasks in README
  # @note `Dir.pwd` will be where the command (ie. rake task or test command) is run from - not the path to this file
  def call
    path = File.join(Dir.pwd, @filepath)

    file = File.open(path, "r")
    JSON.parse(file.read).fetch("ORDERS").select{|item| item.fetch("O_ID") == item.fetch("OMS_ORDER_ID")}

      ensure
    file&.close
  end
end


shipments_processor = ShipmentsProcessor.new(filepath: "spec/fixtures/shipments.json")
