require_relative "../../../lib/services/fetch_warehouse"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"

module Store
  WAREHOUSE = []
end

RSpec.describe Store::FetchWarehouse do
  let(:product_id) { 1 }
  let(:create_warehouse) { Store::Warehouse.new(product_id, 2) }

  subject(:warehouse) { Store::FetchWarehouse.new }

  before do
    Store::WAREHOUSE.clear
    Store::WAREHOUSE << create_warehouse
  end

  describe "#call" do

    it "returns information about one product in warehouse" do
      expect(warehouse.call(product_id)).to eq(create_warehouse)
    end
  end
end
