require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"

module Store
  WAREHOUSE = []
end

RSpec.describe Store::CreateWarehouse do
  let(:product_id) { 1 }
  let(:amount) { 10 }
  let(:create_warehouse) { Store::Warehouse.new(product_id, amount) }

  subject(:warehouse) { Store::CreateWarehouse.new }

  before do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let(:warehouse_array) { Store::WAREHOUSE <<  create_warehouse }

    it "create information about product in warehouse" do
      expect(warehouse.call(product_id, amount)).to eq(warehouse_array)
    end
  end
end
