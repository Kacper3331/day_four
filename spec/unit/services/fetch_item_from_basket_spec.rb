require_relative "../../../lib/services/fetch_item_from_basket"
require_relative "../../../lib/model/basket"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchItemFromBasket do
  include_examples :models

  let(:add_item_to_basket) { Store::Basket.new(product_id: 1, quantity: 1) }

  subject(:fetch_item_from_basket) { Store::FetchItemFromBasket.new }

  before do
    Store::BASKET.clear
    Store::BASKET << add_item_to_basket
  end

  describe "#call" do
    it "returns information about single item in basket" do
      expect(fetch_item_from_basket.call(add_item_to_basket.id)).to eq(add_item_to_basket)
    end
  end
end
