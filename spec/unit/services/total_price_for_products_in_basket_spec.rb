require_relative "../../../lib/services/total_price_for_products_in_basket"
require_relative "../../../lib/services/fetch_basket"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"

module Store
  BASKET =[]
  PRODUCTS = []
end

RSpec.describe Store::TotalPriceForProductsInBasket do
  let(:product_id) { 1 }
  let(:quantity) { 10 }
  let(:price) { 10.00 }
  let(:total_price_with_vat) { (price * quantity) * 1.23 }

  subject(:total_price) { Store::TotalPriceForProductsInBasket.new }

  before :all do
    Store::BASKET.clear
    Store::PRODUCTS.clear
  end

  describe "#call" do
    let(:create_product) { Store::Product.new("Foo", price) }
    let(:create_basket) { Store::Basket.new(product_id: create_product.id, quantity: quantity) }
    let!(:array_of_products) { Store::PRODUCTS << create_product }
    let!(:basket_array) { Store::BASKET << create_basket }

    it "returns total price for product" do
      expect(total_price.call).to eq(total_price_with_vat)
    end
  end

end
