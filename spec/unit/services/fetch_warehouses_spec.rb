require_relative "../../../lib/services/fetch_warehouses"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"

module Store
  WAREHOUSE = []
end

RSpec.describe Store::FetchWarehouses do
  let(:create_warehouse) { Store::Warehouse.new(1, 2) }

  subject(:warehouses) { Store::FetchWarehouses.new }

  before do
    Store::WAREHOUSE.clear
    Store::WAREHOUSE << create_warehouse
  end

  describe "#call" do
    let(:first_product) { create_warehouse.first }

    it "returns warehouse" do
      expect(warehouses.call).to eq([create_warehouse])
    end
  end
end
