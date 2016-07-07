class Product
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = set_price(price)
  end

  def price_with_vat
    price * 1.23
  end

  private
  def set_price(price)
    raise ArgumentError unless price.is_a?(Numeric)
    raise ArgumentError if price <= 0
    price
  end
end
