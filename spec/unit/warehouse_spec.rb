require_relative "../../lib/warehouse.rb"

RSpec.describe Warehouse do
  let(:empty_warehouse) { Warehouse.new(product_id: nil, amount: nil) }
  let(:warehouse) { Warehouse.new(product_id: 1, amount: 10) }
  let(:updated_amount) { { amount: 2 } }
  let(:empty_amount) { { amount: nil } }

  it "has 2 params" do
    expect {
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

  describe "#update" do
    context "when parameter is provided" do
      it "change product amount in warehouse" do
        expect {
            warehouse.update(updated_amount)
        }.to change{ warehouse.amount }.from(10).to(2)
      end
    end

    context "when parameter is not provided" do
      it "doesn\'t change product amount in warehouse" do
        expect {
            warehouse.update(empty_amount)
        }.to_not change{ warehouse.amount }
      end
    end
  end
end
