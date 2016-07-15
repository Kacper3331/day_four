require_relative "../../../lib/services/fetch_items_from_basket"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchItemsFromBasket do
  include_examples :models

  let(:quantity) { 10 }
  let(:price) { 10.00 }
  let(:id) { 1 }
  let(:price_with_vat) { price * 1.23 }
  let(:total_price) { price * quantity }
  let(:total_price_with_vat) { total_price * 1.23}
  let(:create_product) { Store::Product.new("Foo", 10.00) }
  let(:add_item_to_basket) { Store::Basket.new(product_id: create_product.id, quantity: quantity) }
  let(:result) { [
    product: create_product,
    id: @@id,
    quantity: quantity,
    price_with_vat: price_with_vat,
    total_price: total_price,
    total_price_with_vat: total_price_with_vat
  ] }

  subject(:fetch_items_from_basket) { Store::FetchItemsFromBasket.new }

  before do
    @@id = 0
    Store::BASKET.clear
    Store::PRODUCTS .clear
    Store::PRODUCTS << create_product
    Store::BASKET << add_item_to_basket
  end

  describe "#call" do
    it "returns information about items in basket" do
      expect(fetch_items_from_basket.call).to eq(result)
    end
  end
end
