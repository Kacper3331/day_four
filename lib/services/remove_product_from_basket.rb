module Store
  class RemoveProductFromBasket
    def call(product_id, quantity)
      if !Store::FetchBasket.new.call(product_id).nil?
        BASKET.delete_if { |item| item.product_id == product_id }
      end
    end
  end
end
