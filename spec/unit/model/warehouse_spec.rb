require_relative "../../../lib/model/warehouse.rb"
require_relative "../../support/shared_examples/models"

RSpec.describe Store::Warehouse do
  include_examples :models

  let(:create_warehouse) { Store::Warehouse.new(1, 10) }

  describe "#product_id " do
    it "returns 1 when 1 is given" do
      expect(create_warehouse.product_id).to eql(1)
    end
  end

  describe "#amount " do
    it "returns 10 when 10 is given" do
      expect(create_warehouse.amount).to eql(10)
    end
  end
end
