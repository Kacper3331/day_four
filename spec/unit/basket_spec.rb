require_relative "../../lib/basket.rb"
require_relative "../../lib/product.rb"
require_relative "../../lib/warehouse.rb"

RSpec.describe Basket do
  let(:product) { Product.new(name: "Foo", price: 10.00) }
  let(:products) { [product] }
  let(:warehouses) { Warehouse.new(product_id: product.id, amount: 2) }
  let(:empty_warehouses) { Warehouse.new(product_id: product.id, amount: 0) }
  let(:quantity) { 1 }
  let(:basket) { Basket.new(selected_products= products, products: products, warehouses: [warehouses]) }
  let(:empty_basket) { Basket.new(products: products, warehouses: [empty_warehouses]) }

  it "has 2 params" do
    expect{
      basket
    }.to_not raise_error(ArgumentError)
  end

  describe "#remove_product" do
    context "when product is in the basket" do
      it "return message" do
        expect(basket.remove_product(product.id, quantity)).
          to eq("Removed from basket: Foo in amount of 1")
      end
    end

    context "when product is not in the basket" do
      it "return a message" do
        expect(empty_basket.remove_product(product.id, quantity)).
          to eq("Product is not in the basket")
      end
    end
  end

  describe "#add_product" do
    context "when wharehouse has product" do
      it "return message" do
        expect(basket.add_product(product.id, quantity)).
          to eq("Added to basket: Foo in amount of 1")
      end
    end

    context "when warehouse doesn\'t have a product" do
      it "return message" do
        expect(empty_basket.add_product(product.id, quantity)).
          to eq("You can't buy Foo, not enough amount in warehouse")
      end
    end
  end

  describe "#total_price" do
    it "return sum of all products in basket" do
      expect(basket.total_price).to eq(10.00)
    end
  end

  describe "#total_price_with_vat" do
    it "return sum with VAT of all products in basket" do
      expect(basket.total_price_with_vat).to eq(12.30)
    end
  end
end
