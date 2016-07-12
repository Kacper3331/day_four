module Store
  class FetchBasket
    def call(product_id)
      BASKET.find { |item| item.product_id == product_id }
    end
  end
end
