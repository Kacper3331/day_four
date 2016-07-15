require_relative "../../../lib/services/create_product"
require_relative "../../../lib/model/product"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::CreateProduct do
  include_examples :models

  let(:name) { "Foo" }
  let(:price) { 10.0 }
  let(:create_product) { Store::Product.new(name, price) }

  subject(:product) { Store::CreateProduct.new }

  before do
    Store::PRODUCTS.clear
  end

  describe "#call" do
    let(:array_of_products) { Store::PRODUCTS << create_product }

    it "create new product" do
      expect(product.call(name, price)).to eq(array_of_products)
    end
  end
end
