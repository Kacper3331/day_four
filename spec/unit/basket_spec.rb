require_relative "../../lib/basket.rb"
require_relative "../../lib/product.rb"
require_relative "../../lib/warehouse.rb"



RSpec.describe Basket do
  let(:product) { Product.new(name: "Foo", price: 10.00) }
  let(:products) { [product] }
  # let(:warehouse) { Warehouse.new(product_id: product.id, amount: 2) }
  let(:warehouses) { Warehouse.new(product_id: product.id, amount: 2) }
  let(:empty_baskets) { Basket.new }
  let(:quantity) { 1 }
  let(:basket) { Basket.new(products) }

  it "should be a array" do
    expect(empty_baskets.basket).to eq ([])
  end

  it "should add a product to basket" do
    # expect(empty_baskets.add(products, product.id, warehouses, quantity)).to match("Added to basket: #{product.name} in amount of #{quantity}")
    expect([warehouses]).to receive(:find).and_return(warehouses)
    Basket.new.add(products, product.id, [warehouses], quantity)
  end

  context "#sum" do
    it "should return sum of all products in basket" do
      expect(basket.sum).to eq(10.00)
    end
  end

  context "#sum_with_vat" do
    it "should return sum with VAT of all products in basket" do
      expect(basket.sum_with_vat).to eq(12.30)
    end
  end
end
