require_relative "../../../lib/model/basket.rb"
require_relative "../../../lib/services/fetch_product.rb"
require_relative "../../../lib/model/product.rb"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::Basket do
  include_examples :models

  let(:create_product) { Store::Product.new("Foo", 10.00) }
  let(:quantity) { 1 }
  let(:add_product_to_basket) { Store::Basket.new(product_id: create_product.id, quantity: quantity) }

  before do
    Store::PRODUCTS.clear
    Store::PRODUCTS << create_product
  end

  it "has 2 arguments" do
    expect {
      add_product_to_basket
    }.to_not raise_error
  end

  describe "#fetch_product" do
    it "returns information about one product" do
      expect(add_product_to_basket.fetch_product).to eq(create_product)
    end
  end

  describe "#price_with_vat" do
    it "returns price netto increased by VAT" do
      expect(add_product_to_basket.price_with_vat).to eq(12.30)
    end
  end

  describe "#total_price" do
    it "return sum of all products in basket" do
      expect(add_product_to_basket.total_price).to eq(10.00)
    end
  end

  describe "#total_price_with_vat" do
    it "return sum with VAT of all products in basket" do
      expect(add_product_to_basket.total_price_with_vat).to eq(12.30)
    end
  end

  describe "#quantity" do
    it "must be a numebr" do
      expect {
        Store::Basket.new(1, "foo")
      }.to raise_error(ArgumentError)
    end

    it "must be greater than 0" do
      expect {
        Store::Basket.new(1, -10)
      }.to raise_error(ArgumentError)
    end
  end
end
