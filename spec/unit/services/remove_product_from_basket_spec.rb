require_relative "../../../lib/services/remove_product_from_basket"
require_relative "../../../lib/services/fetch_basket"
require_relative "../../../lib/model/basket"

module Store
  BASKET = []
end

RSpec.describe Store::RemoveProductFromBasket do
  let(:product_id) { 1 }
  let(:quantity) { 10 }
  let(:params) { 1 }
  let(:create_basket) { Store::Basket.new(product_id: product_id, quantity: quantity) }

  subject(:remove_product) { Store::RemoveProductFromBasket.new(params) }

  before do
    Store::BASKET.clear
  end

  describe "#call" do
    let(:basket_array) { Store::BASKET << create_basket }

    it "returns empty array" do
      expect(remove_product.call).to eq([])
    end
  end
end
