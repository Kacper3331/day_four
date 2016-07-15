require_relative "../../../lib/services/create_warehouse"
require_relative "../../../lib/model/warehouse"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::CreateWarehouse do
  include_examples :models

  let(:product_id) { 1 }
  let(:amount) { 10 }
  let(:add_product_to_warehouse) { Store::Warehouse.new(product_id, amount) }

  subject(:warehouse) { Store::CreateWarehouse.new }

  before do
    Store::WAREHOUSE.clear
  end

  describe "#call" do
    let(:warehouse_array) { Store::WAREHOUSE <<  add_product_to_warehouse }

    it "add information about product to warehouse" do
      expect(warehouse.call(product_id, amount)).to eq(warehouse_array)
    end
  end
end
