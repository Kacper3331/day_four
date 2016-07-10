require_relative "../../lib/product.rb"

RSpec.describe Product do
  let(:price) { 12 }
  let(:product) { Product.new(name: "Foo", price: price) }
  let(:amount) { 2 }
  let(:updated_name) { { name: "Foo_update" } }
  let(:updated_price) { { price: 10 } }
  let(:empty_name) { { name: nil } }
  let(:empty_price) { { price: nil } }

  before { @@id = 0 }

  it "has 2 params" do
    expect {
      product_with_price
    }.to_not raise_error(ArgumentError)
  end

  describe "#id" do
    it "returns id when product is generated" do
      expect(product.id).to eql(1)
    end
  end

  describe "#show_product" do
    it "return information about product" do
      expect(product.show_product).to eq("ID: 1 \t|\t NAME: Foo \t|\t PRICE: 12")
    end
  end

  describe "#show_discount_product" do
    it "return text with the discounted product" do
      expect(product.show_discount_product(amount)).to eq("\tNAME: Foo \t|\t SPECIAL PRICE: 10 zl")
    end
  end

  describe "#update" do
    context "when parameters are provided" do
      it "change the name of the product" do
        expect {
          product.update(updated_name)
        }.to change{ product.name }.from("Foo").to("Foo_update")
      end

      it "update price of the product" do
        expect {
          product.update(updated_price)
        }.to change{ product.price }.from(price).to(10)
      end
    end

    context "when parameters are not provided" do
      it "doesn\'t change name of the product" do
        expect {
          product.update(empty_name)
        }.to_not change{ product.name }
      end

      it "doesn\'t change price of the product" do
        expect {
          product.update(empty_price)
        }.to_not change{ product.price }
      end
    end
  end

  describe "#discount" do
    it "compute discount of the price" do
      expect(product.discount(price, amount)).to eql(10)
    end
  end

  describe "#name" do
    it "returns foo when foo is given" do
      expect(Product.new(name: "foo", price: price).name).to eql("foo")
    end

    it "return a meessage when number is not string" do
      expect {
        Product.new(name: 12, price: price).name
      }.to raise_error(ArgumentError)
    end
  end

  describe "#price" do
    it "returns 12 when 12 is given" do
      expect(product.price).to eql(12)
    end

    it "raises a error for invalid price" do
      expect {
       Product.new(name: "Foo", price: nil).price
     }.to raise_error(ArgumentError)
    end

    it "must be > 0" do
      expect {
        product = Product.new(nil, -10)
        product.price
      }.to raise_error(ArgumentError)
    end
  end

  describe "#price_with_vat" do
    it "return price with VAT" do
      expect(product.price_with_vat).to eql(14.76)
    end
   end
end
