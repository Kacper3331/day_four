require_relative "../../lib/basket.rb"
require_relative "../../lib/product.rb"
require_relative "../../lib/warehouse.rb"

RSpec.describe Basket do
  let(:product) { Product.new(name: "Foo", price: 10.00) }
  let(:products) { [product] }
  let(:warehouses) { Warehouse.new(product_id: product.id, amount: 2) }
  let(:quantity) { 1 }
  let(:basket) { Basket.new(products) }

  context "#remove_products_from_basket" do
    it "should remove products from basket" do
      expect(basket.remove_product_from_basket(products, product.id, [warehouses], quantity)).to eq(3)
    end
  end

  context "#add_produts_to_basket" do
    it "should add product to basket" do
      expect(basket.add_produt_to_basket(products, product.id, [warehouses], quantity)).to eq(1)
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
