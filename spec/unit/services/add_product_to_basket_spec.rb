require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/model/basket"

module Store
  BASKET = []
end

RSpec.describe Store::AddProductToBasket do
  let(:quantity) { 2 }
  let(:product_id) { 1 }
  let(:create_basket) { Store::Basket.new(product_id, quantity) }

  subject(:add_product) { Store::AddProductToBasket.new }

  before do
    Store::BASKET.clear
    Store::BASKET << create_basket
  end

  describe "#call" do

    it "adds product to basket" do
      expect(add_product.call(product_id, quantity)).to eq(Store::BASKET)
    end
  end
end
