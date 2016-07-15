require_relative "../../../lib/model/basket.rb"
require_relative "../../../lib/services/fetch_product.rb"
require_relative "../../../lib/model/product.rb"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::Basket do
  include_examples :models

  let(:create_product) { Store::Product.new("Foo", 10.00) }
  let(:quantity) { 1 }
  let(:create_basket) { Store::Basket.new(product_id: create_product.id, quantity: quantity) }

  before do
    Store::PRODUCTS.clear
    Store::PRODUCTS << create_product
  end

  describe "#fetch_product" do
    it "returns information about one product" do
      expect(create_basket.fetch_product).to eq(create_product)
    end
  end

  describe "#price_with_vat" do
    it "returns price netto increased by VAT" do
      expect(create_basket.price_with_vat).to eq(12.30)
    end
  end

  describe "#total_price" do
    it "return sum of all products in basket" do
      expect(create_basket.total_price).to eq(10.00)
    end
  end

  describe "#total_price_with_vat" do
    it "return sum with VAT of all products in basket" do
      expect(create_basket.total_price_with_vat).to eq(12.30)
    end
  end
end
