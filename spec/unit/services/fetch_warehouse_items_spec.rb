require_relative "../../../lib/services/fetch_warehouse_items"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchWarehouseItems do
  include_examples :models

  let(:add_product_to_warehouse) { Store::Warehouse.new(1, 2) }

  subject(:fetch_warehouse_items) { Store::FetchWarehouseItems.new }

  before do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let!(:warehouse) { Store::WAREHOUSE << add_product_to_warehouse }

    it "returns information about all products in warehouse" do
      expect(fetch_warehouse_items.call).to eq(warehouse)
    end
  end
end
