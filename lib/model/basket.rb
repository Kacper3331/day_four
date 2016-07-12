module Store
  class Basket
    attr_reader :product_id, :quantity

    def initialize(product_id, quantity)
      @product_id = product_id
      @quantity = quantity
    end

    def total_price
      selected_products.map(&:price).reduce(0, :+)
    end

    def total_price_with_vat
      total_price * 1.23
    end
  end
end
