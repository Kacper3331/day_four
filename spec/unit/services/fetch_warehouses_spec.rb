require_relative "../../../lib/services/fetch_warehouses"
require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"

module Store
  WAREHOUSE = []
end

RSpec.describe Store::FetchWarehouses do
  let(:create_warehouse) { Store::Warehouse.new(1, 2) }

  subject(:warehouses) { Store::FetchWarehouses.new }

  before :all do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let!(:warehouse_array) { Store::WAREHOUSE << create_warehouse }

    it "returns warehouse" do
      expect(warehouses.call).to eq(warehouse_array)
    end
  end
end
