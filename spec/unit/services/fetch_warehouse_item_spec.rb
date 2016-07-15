require_relative "../../../lib/services/fetch_warehouse_item"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchWarehouseItem do
  include_examples :models

  let(:product_id) { 1 }
  let(:add_product_to_warehouse) { Store::Warehouse.new(product_id, 2) }

  subject(:fetch_warehouse_item) { Store::FetchWarehouseItem.new }

  before do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let!(:warehouse) { Store::WAREHOUSE << add_product_to_warehouse }

    it "returns information about one product in warehouse" do
      expect(fetch_warehouse_item.call(product_id)).to eq(add_product_to_warehouse)
    end
  end
end
