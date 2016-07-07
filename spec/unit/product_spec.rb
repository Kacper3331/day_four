require_relative "../../lib/product.rb"

RSpec.describe Product do
  let(:price) { 12 }
  let(:product_with_price) { Product.new(name: nil, price: price) }
  let(:amount) { 2 }

  before { @@id = 0 }

  it "has 2 params" do
    expect{
      product_with_price
    }.to_not raise_error(ArgumentError)
  end

# .name -> metoda klasowa, #name -> metoda instancyjna
  context "#id" do
    it "returns id when product is generated" do
      product_with_price
      expect(product_with_price.id).to eql(1)
    end
  end

  context ".discount" do
    it "compute discount of the price" do
      puts product_with_price
      expect(product_with_price.discount(price, amount)).to eql(10)
    end
  end

  context "#name " do
    it "returns foo when foo is given" do
      expect(Product.new(name: "foo", price: price).name).to eql("foo")
    end
  end

  context "#price" do
    it "returns 12 when 12 is given" do
      expect(product_with_price.price).to eql(12)
    end

    it "raises error for invalid price" do
      expect{
       Product.new(name: nil, price: nil).price
     }.to raise_error(ArgumentError)
    end

    it "must be > 0" do
      expect{
        product = Product.new(nil, -10)
        product.price
      }.to raise_error(ArgumentError)
    end
  end

  context "#price_with_vat" do
    it "return price with VAT" do
      expect(product_with_price.price_with_vat).to eql(14.76)
    end
   end
end
