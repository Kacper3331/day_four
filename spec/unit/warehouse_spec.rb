require_relative "../../lib/warehouse.rb"

RSpec.describe Warehouse do
  let(:empty_warehouse) { Warehouse.new(product_id: nil, amount: nil) }
  let(:warehouse) { Warehouse.new(product_id: 1, amount: 10) }

  it "has 2 params" do
    expect{
      empty_warehouse
    }.to_not raise_error(ArgumentError)
  end

  describe "#product_id " do
    it "returns 1 when 1 is given" do
      expect(warehouse.product_id).to eql(1)
    end
  end

  describe "#amount " do
    it "returns 10 when 10 is given" do
      expect(warehouse.amount).to eql(10)
    end
  end
end
