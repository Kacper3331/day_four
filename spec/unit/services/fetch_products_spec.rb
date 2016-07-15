require_relative "../../../lib/services/fetch_products"
require_relative "../../../lib/services/create_product"
require_relative "../../../lib/model/product"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::FetchProducts do
  include_examples :models

  let(:create_product) { Store::Product.new("Foo", 10.0) }

  subject(:fetch_products) { Store::FetchProducts.new }

  before do
    Store::PRODUCTS.clear
  end

  describe "#call" do
    let(:products) { Store::PRODUCTS << create_product }

    it "returns all products" do
      expect(fetch_products.call).to eq(products)
    end
  end
end
