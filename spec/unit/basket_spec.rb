require_relative "../../lib/basket.rb"
require_relative "../../lib/product.rb"
require_relative "../../lib/warehouse.rb"

RSpec.describe Basket do
  let(:product) { Product.new(name: "Foo", price: 10.00) }
  let(:products) { [product] }
  let(:warehouses) { Warehouse.new(product_id: product.id, amount: 2) }
  let(:empty_warehouse) { Warehouse.new(product_id: product.id, amount: 0) }
  let(:quantity) { 1 }
  let(:basket) { Basket.new(products) }
  let(:empty_basket) { Basket.new }

  describe "#remove_product" do
    context "when product is in the basket" do
      it "should return message" do
        expect(basket.remove_product(product.id, [warehouses], quantity)).
          to eq("Removed from basket: Foo in amount of 1")
      end
    end

    context "when product is not in the basket" do
      it "should return a message" do
        expect(empty_basket.remove_product(product.id, [warehouses], quantity)).
          to eq("Product is not in the basket")
      end
    end
  end

  describe "#remove_product_from_basket" do
    it "should remove products from basket" do
      expect(basket.remove_product_from_basket(product.id, [warehouses], quantity)).
        to eq(3)
    end
  end

  describe "#add_product" do
    context "when wharehouse has product" do
      it "should return message" do
        expect(basket.add_product(products, product.id, [warehouses], quantity)).
          to eq("Added to basket: Foo in amount of 1")
      end
    end

    context "when warehouse doesn\'t have a product" do
      it "should return message" do
        expect(basket.add_product(products, product.id, [empty_warehouse], quantity)).
          to eq("You can't buy Foo, not enough amount in warehouse")
      end
    end
  end

  describe "#add_product_to_basket" do
    it "should add product to basket" do
      expect(basket.add_product_to_basket(products, product.id, [warehouses], quantity)).
        to eq(1)
    end
  end

  describe "#total_price" do
    it "should return sum of all products in basket" do
      expect(basket.total_price).to eq(10.00)
    end
  end

  describe "#total_price_with_vat" do
    it "should return sum with VAT of all products in basket" do
      expect(basket.total_price_with_vat).to eq(12.30)
    end
  end
end
