require_relative "../../lib/shipments_processor"

RSpec.describe ShipmentsProcessor do
  describe "#call" do
    context "when passed valid file path" do
      it "converts the JSON file to a Ruby object" do
        shipments_processor = ShipmentsProcessor.new(filepath: "spec/fixtures/shipments.json")

        result = shipments_processor.call

        aggregate_failures do
         / expect(result).to be_instance_of(Array) /
        /  expect(result).to have_key("ORDERS") /
         / expect(result.fetch("ORDERS")).to be_instance_of(Array) /
          / expect(result.length).to eq 2 /
          expect(result.fetch("cancellations").length).to eq 1
          expect(result.fetch("fulfillment").length).to eq 2
        end
      end
    end
  end
end

