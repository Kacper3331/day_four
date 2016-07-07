class Warehouse
  attr_reader :product_id
  attr_accessor :amount

  def initialize(product_id:, amount:)
    @product_id = product_id
    @amount = amount
  end
end
