require_relative "../../../lib/services/fetch_basket"
require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"

module Store
  BASKET = []
  PRODUCTS = []
end

RSpec.describe Store::FetchBasket do
  let(:quantity) { 10 }
  let(:price) { 10.00 }
  let(:id) { 1 }
  let(:price_with_vat) { price * 1.23 }
  let(:total_price) { price * quantity }
  let(:total_price_with_vat) { total_price * 1.23}
  let(:product) { Store::Product.new("Foo", 10.00) }
  let(:create_basket) { Store::Basket.new(product_id: product.id, quantity: quantity) }
  let(:result) { [
    product: product,
    id: @@id,
    quantity: quantity,
    price_with_vat: price_with_vat,
    total_price: total_price,
    total_price_with_vat: total_price_with_vat
  ] }

  subject(:basket) { Store::FetchBasket.new }

  before do
    @@id = 0
    Store::BASKET.clear
    Store::PRODUCTS << product
    Store::BASKET << create_basket
  end

  describe "#call" do
    it 'returns information about basket' do
      expect(basket.call).to eq(result)
    end
  end
end
