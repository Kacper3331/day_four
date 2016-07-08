require_relative "../../lib/basket.rb"
require_relative "../../lib/product.rb"
require_relative "../../lib/warehouse.rb"

RSpec.describe Basket do
  let(:product) { Product.new(name: "Foo", price: 10.00) }
  let(:products) { [product] }
  let(:warehouses) { Warehouse.new(product_id: product.id, amount: 2) }
  let(:warehouse_empty) { Warehouse.new(product_id: product.id, amount: 0) }
  let(:quantity) { 1 }
  let(:basket) { Basket.new(products) }

  context "#remove_product" do
    it "should return nil if product is removed from the basket" do
      expect(basket.remove_product(products, product.id, [warehouses], quantity)).to eq(nil)
    end
    it "should remove products from basket" do
      expect(basket.remove_product_from_basket(products, product.id, [warehouses], quantity)).to eq(3)
    end
  end

  context "#add_product" do
    it "should check if warehouse has a product" do
      expect(basket.add_product(products, product.id, [warehouses], quantity)).to eq(1)
    end
    it "should add product to basket" do
      expect(basket.add_product_to_basket(products, product.id, [warehouses], quantity)).to eq(1)
    end
    it "should return nil if warehouse doesn\'t have a product" do
      expect(basket.add_product(products, product.id, [warehouse_empty], quantity)).to eq(nil)
    end
  end

  context "#total_price" do
    it "should return sum of all products in basket" do
      expect(basket.total_price).to eq(10.00)
    end
  end

  context "#total_price_with_vat" do
    it "should return sum with VAT of all products in basket" do
      expect(basket.total_price_with_vat).to eq(12.30)
    end
  end
end
