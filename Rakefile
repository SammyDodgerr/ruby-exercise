require_relative "./lib/shipments_processor"

namespace :shipments do
  task :process, [:filepath] do |_task, args|
    ShipmentsProcessor.new(filepath: args[:filepath]).call
  end
end
