require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/create_product"
require_relative "../../../lib/model/product"

module Store
  PRODUCTS = []
end

RSpec.describe Store::FetchProduct do
  let(:create_product) { Store::Product.new("Foo", 9.99) }

  subject(:product) { Store::FetchProduct.new }

  before do
    Store::PRODUCTS.clear
    Store::PRODUCTS << create_product
  end

  describe "#call" do
    it "returns information about one product" do
      expect(product.call(create_product.id)).to eq(create_product)
    end
  end
end
