module Store
  class FetchItemFromBasket
    def call(item_id)
      BASKET.find do |item|
        item.id == item_id
      end
    end
  end
end
