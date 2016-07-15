require_relative "../../../lib/model/warehouse.rb"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::Warehouse do
  include_examples :models

  let(:add_product_to_warehouse) { Store::Warehouse.new(1, 10) }

  describe "#product_id " do
    it "returns 1 when 1 is given" do
      expect(add_product_to_warehouse.product_id).to eql(1)
    end
  end

  describe "#amount " do
    it "returns correctly set amount" do
      expect(add_product_to_warehouse.amount).to eql(10)
    end

    it "must be a number" do
      expect {
       Store::Warehouse.new(1, "foo")
     }.to raise_error(ArgumentError)
    end

    it "must be greater than 0" do
      expect {
        Store::Warehouse.new(1, -10)
      }.to raise_error(ArgumentError)
    end
  end
end
