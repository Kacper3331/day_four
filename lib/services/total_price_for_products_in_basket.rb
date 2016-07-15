module Store
  class TotalPriceForProductsInBasket
    def call
      basket = FetchItemsFromBasket.new.call.map { |item| item[:total_price_with_vat] }
      !basket.empty? ? basket.reduce(:+).round(2) : 0
    end
  end
end
