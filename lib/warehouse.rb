class Warehouse
  attr_reader :product_id
  attr_accessor :amount

  def initialize(product_id:, amount:)
    @product_id = product_id
    @amount = amount
  end

  def update(parameter)
    @amount = parameter[:amount] if !parameter[:amount].nil?
  end
end
