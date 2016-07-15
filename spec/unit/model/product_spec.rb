require_relative "../../../lib/model/product.rb"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::Product do
  include_examples :models

  let(:price) { 12 }
  let(:create_product) { Store::Product.new("Foo", price) }

  before { @@id = 0 }

  describe "#id" do
    it "returns id when product is generated" do
      expect(create_product.id).to eql(1)
    end
  end

  describe "#name" do
    it "returns foo when foo is given" do
      expect(Store::Product.new("foo", price).name).to eql("foo")
    end

    it "return a meessage when number is not string" do
      expect {
        Store::Product.new(12, price).name
      }.to raise_error(ArgumentError)
    end
  end

  describe "#price" do
    it "returns 12 when 12 is given" do
      expect(create_product.price_netto).to eql(12)
    end

    it "raises a error for invalid price" do
      expect {
       Store::Product.new("Foo", nil).price_netto
     }.to raise_error(ArgumentError)
    end

    it "must be > 0" do
      expect {
        create_product = Store::Product.new(nil, -10)
        create_product.price_netto
      }.to raise_error(ArgumentError)
    end
  end
end
