module Store
  class AddProductToBasket
    def call(product_id, quantity)
      BASKET << Store::Basket.new(product_id, quantity
      )
    end
  end
end
