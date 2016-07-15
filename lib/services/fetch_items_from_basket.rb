module Store
  class FetchItemsFromBasket
    def call
      BASKET.map do |item|
        {
          product: item.fetch_product,
          id: item.id,
          quantity: item.quantity,
          price_with_vat: item.price_with_vat,
          total_price: item.total_price,
          total_price_with_vat: item.total_price_with_vat
        }
      end
    end
  end
end
