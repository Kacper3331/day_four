require_relative "../../../lib/services/fetch_basket"
require_relative "../../../lib/services/add_product_to_basket"
require_relative "../../../lib/model/basket"
require_relative "../../../lib/model/product"

module Store
  BASKET = []
end

RSpec.describe Store::FetchBasket do
  let(:product_id) { 1 }
  let(:quantity) { 10 }
  let(:create_basket) { Store::Basket.new(product_id, quantity) }

  subject(:basket) { Store::FetchBasket.new }

  before do
    Store::BASKET.clear
    Store::BASKET << create_basket
  end

  describe "#call" do

    it 'returns information about first item in basket' do
      expect(basket.call(product_id)).to eq(create_basket)
    end
  end
end
