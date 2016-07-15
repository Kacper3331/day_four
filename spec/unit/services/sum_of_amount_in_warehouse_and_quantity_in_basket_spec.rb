require_relative "../../../lib/services/sum_of_amount_in_warehouse_and_quantity_in_basket"
require_relative "../../../lib/services/fetch_item_from_basket"
require_relative "../../../lib/services/fetch_warehouse_item"
require_relative "../../../lib/model/warehouse"
require_relative "../../../lib/model/basket"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::SumOfAmountInWarehouseAndQuantityInBasket do
  include_examples :models

  let(:product_id) { 1 }
  let(:create_warehouse) { Store::Warehouse.new(product_id, 1) }
  let(:create_basket) { Store::Basket.new(product_id: product_id, quantity: 1) }

  subject(:add_quantity) { Store::SumOfAmountInWarehouseAndQuantityInBasket.new(create_basket.id) }

  before do
    Store::BASKET.clear
    Store::WAREHOUSE.clear
    Store::WAREHOUSE << create_warehouse
    Store::BASKET << create_basket
  end

  describe "#call" do
    it "returns sum of amount and quantity when user removes product from basket" do
      expect(add_quantity.call).to eq(2)
    end
  end
end
