require_relative "../../../lib/services/total_price_for_products_in_basket"
require_relative "../../../lib/services/fetch_items_from_basket"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::TotalPriceForProductsInBasket do
  include_examples :models

  let(:product_id) { 1 }
  let(:quantity) { 10 }
  let(:price) { 10.00 }
  let(:total_price_with_vat) { (price * quantity) * 1.23 }

  subject(:total_price) { Store::TotalPriceForProductsInBasket.new }

  before do
    Store::BASKET.clear
    Store::PRODUCTS.clear
  end

  describe "#call" do
    let(:create_product) { Store::Product.new("Foo", price) }
    let(:add_item_to_basket) { Store::Basket.new(product_id: create_product.id, quantity: quantity) }
    let!(:products) { Store::PRODUCTS << create_product }
    let!(:basket) { Store::BASKET << add_item_to_basket }

    it "returns total price for product" do
      expect(total_price.call).to eq(total_price_with_vat)
    end
  end
end
