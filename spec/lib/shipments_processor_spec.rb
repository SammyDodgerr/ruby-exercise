require_relative "../../lib/shipments_processor"

RSpec.describe ShipmentsProcessor do
  describe "#call" do
    context "when passed valid file path" do
      it "converts the JSON file to a Ruby object" do
        shipments_processor = ShipmentsProcessor.new(filepath: "spec/fixtures/shipments.json")

        result = shipments_processor.call

        aggregate_failures do
          expect(result).to be_instance_of(Hash)
          expect(result).to have_key("ORDERS")
          expect(result.fetch("ORDERS").length).to eq 3
        end
      end
    end
  end
end
