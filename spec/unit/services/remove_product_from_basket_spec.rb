require_relative "../../../lib/services/remove_product_from_basket"
require_relative "../../../lib/services/fetch_basket"
require_relative "../../../lib/model/basket"

module Store
  BASKET = []
end

RSpec.describe Store::RemoveProductFromBasket do
  let(:product_id) { 1 }
  let(:quantity) { 10 }
  let(:new_basket) { Store::Basket.new(product_id, quantity) }

  subject(:remove_product) { Store::RemoveProductFromBasket.new }

  before do
    Store::BASKET.clear
    Store::BASKET << new_basket
  end

  describe "#call" do
    it "returnd empty array" do
      expect(remove_product.call(product_id, quantity)).to eq([])
    end
  end
end
