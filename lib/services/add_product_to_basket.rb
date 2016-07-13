module Store
  class AddProductToBasket
    def initialize(params)
      @product_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      BASKET << Store::Basket.new(product_id: @product_id, quantity: @quantity)
    end
  end
end
