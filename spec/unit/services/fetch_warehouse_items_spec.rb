require_relative "../../../lib/services/fetch_warehouse_items"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchWarehouseItems do
  include_examples :models

  let(:create_warehouse) { Store::Warehouse.new(1, 2) }

  subject(:warehouses) { Store::FetchWarehouseItems.new }

  before do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let!(:warehouse_array) { Store::WAREHOUSE << create_warehouse }

    it "returns information about all products in warehouse" do
      expect(warehouses.call).to eq(warehouse_array)
    end
  end
end
