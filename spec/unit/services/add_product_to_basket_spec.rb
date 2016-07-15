require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/model/basket"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::AddProductToBasket do
  include_examples :models

  let(:quantity) { 2 }
  let(:product_id) { 1 }
  let(:add_item_to_basket) { Store::Basket.new(product_id: product_id, quantity: quantity) }
  let(:params) { { "product_id" =>  product_id, "quantity" => quantity } }

  subject(:add_product_to_basket) { Store::AddProductToBasket.new(params) }

  before do
    Store::BASKET.clear
    Store::BASKET << add_item_to_basket
  end

  describe "#call" do
    it "adds product to basket" do
      expect(add_product_to_basket.call).to eq(Store::BASKET)
    end
  end
end
