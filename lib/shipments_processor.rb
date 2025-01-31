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
    orders = JSON.parse(file.read).fetch("ORDERS")
    cancellations = orders.select{|item| item.fetch("ORDER_LINES").all?{|item| item.fetch("QUANTITY") == '0'}}
    fulfillment = orders.select{|item| item.fetch("ORDER_LINES").any?{|item| item.fetch("QUANTITY") != '0'}}

{"fulfillment" => fulfillment, "cancellations" => cancellations}

      ensure
    file&.close
  end
end


shipments_processor = ShipmentsProcessor.new(filepath: "spec/fixtures/shipments.json")
puts shipments_processor.call
