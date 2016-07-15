require_relative "../../../lib/services/subtraction_between_amount_in_warehouse_and_quantity_in_basket"
require_relative "../../../lib/model/warehouse"
require_relative "../../../lib/model/basket"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::SubtractionBetweenAmountInWarehouseAndQuantityInBasket do
  include_examples :models

  let(:product_id) { 1 }
  let(:params) { { "product_id" => product_id, "quantity" => 1 } }
  let(:create_warehouse) { Store::Warehouse.new(product_id, 1) }

  subject(:decrease_quantity) {
    Store::SubtractionBetweenAmountInWarehouseAndQuantityInBasket.new(params)
  }

  before do
    Store::WAREHOUSE.clear
    Store::WAREHOUSE << create_warehouse
  end

  describe "#call" do
    it "returns the result of the subtraction between amount and quantity when user adds product to basket" do
      expect(decrease_quantity.call).to eq(0)
    end
  end
end
