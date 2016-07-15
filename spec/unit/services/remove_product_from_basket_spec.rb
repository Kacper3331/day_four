require_relative "../../../lib/services/remove_product_from_basket"
require_relative "../../../lib/services/fetch_items_from_basket"
require_relative "../../../lib/model/basket"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::RemoveProductFromBasket do
  include_examples :models

  let(:product_id) { 1 }
  let(:quantity) { 10 }
  let(:params) { 1 }
  let(:add_item_to_basket) { Store::Basket.new(product_id: product_id, quantity: quantity) }

  subject(:remove_product_from_basket) { Store::RemoveProductFromBasket.new(params) }

  before do
    Store::BASKET.clear
  end

  describe "#call" do
    let(:basket) { Store::BASKET << add_item_to_basket }

    it "returns empty array" do
      expect(remove_product_from_basket.call).to eq([])
    end
  end
end
