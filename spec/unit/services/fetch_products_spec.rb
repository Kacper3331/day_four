require_relative "../../../lib/services/fetch_products"
require_relative "../../../lib/services/create_product"
require_relative "../../../lib/model/product"

module Store
  PRODUCTS = []
end

RSpec.describe Store::FetchProducts do
  let(:create_product) { Store::Product.new("Foo", 9.99) }

  subject(:products) { Store::FetchProducts.new }

  before do
    Store::PRODUCTS.clear
    Store::PRODUCTS << create_product
  end

  describe "#call" do
    let(:first_product) { create_product.first }

    it "returns all products" do
      expect(products.call).to eq(Store::PRODUCTS)
    end
  end
end
