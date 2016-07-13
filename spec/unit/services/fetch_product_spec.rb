require_relative "../../../lib/services/fetch_product"
require_relative "../../../lib/services/create_product"
require_relative "../../../lib/model/product"

module Store
  PRODUCTS = []
end

RSpec.describe Store::FetchProduct do
  subject(:fetch_product) { Store::FetchProduct.new }

  before do
    Store::PRODUCTS.clear
  end

  describe "#call" do
    let(:create_product) { Store::Product.new("Foo", 10.0) }

    before do
      Store::PRODUCTS << create_product
    end

    it "returns information about single product" do
      expect(fetch_product.call(create_product.id)).to eq(create_product)
    end
  end
end
