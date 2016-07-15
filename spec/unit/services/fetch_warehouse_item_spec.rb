require_relative "../../../lib/services/fetch_warehouse_item"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchWarehouseItem do
  include_examples :models

  let(:product_id) { 1 }
  let(:create_warehouse) { Store::Warehouse.new(product_id, 2) }

  subject(:fetch_warehouse) { Store::FetchWarehouseItem.new }

  before do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let!(:warehouse_array) { Store::WAREHOUSE << create_warehouse }

    it "returns information about one product in warehouse" do
      expect(fetch_warehouse.call(product_id)).to eq(create_warehouse)
    end
  end
end
