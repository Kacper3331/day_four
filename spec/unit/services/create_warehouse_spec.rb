require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"

module Store
  WAREHOUSE = []
end

RSpec.describe Store::CreateWarehouse do
  let(:product_id) { 1 }
  let(:amount) { 10 }
  let(:warehouse) { Store::Warehouse.new(product_id, amount) }

  subject(:create_warehouse) { Store::CreateWarehouse.new }

  before do
    Store::WAREHOUSE.clear
    Store::WAREHOUSE <<  warehouse
  end

  describe "#call" do
    it "create new product" do
      expect(create_warehouse.call(product_id, amount)).to eq(Store::WAREHOUSE)
    end
  end
end
