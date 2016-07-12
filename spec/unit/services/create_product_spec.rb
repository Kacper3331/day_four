require_relative "../../../lib/services/create_product"
require_relative "../../../lib/model/product"

module Store
  PRODUCTS = []
end

RSpec.describe Store::CreateProduct do
  let(:name) { "Foo" }
  let(:price) { 9.99 }
  let(:add_product) { Store::Product.new(name, price) }

  subject(:create_product) { Store::CreateProduct.new }

  before do
    Store::PRODUCTS.clear
    Store::PRODUCTS << add_product
  end

  describe "#call" do
    it "create new product" do
      expect(create_product.call(name, price)).to eq(Store::PRODUCTS)
    end
  end
end
