require_relative "../../lib/basket.rb"
require_relative "../../lib/product.rb"


RSpec.describe Basket do
  let(:product) { Product.new(name: "Foo", price: 10.00) }
  let(:products) { [product] }
  let(:warehouses) { [product_id: product.id, amount: 2] }
  let(:empty_baskets) { Basket.new }
  let(:quantity) { 1 }
  let(:baskets) { [product] }

  it "should be a array" do
    expect(empty_baskets.basket).to eq ([])
  end

  it "should add a product to basket" do
    expect(empty_baskets.add(products, product.id, warehouses, 1).to eq(baskets))
  end
end
