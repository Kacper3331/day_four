module Store
  class RemoveProductFromBasket
    def initialize(item_id)
      @item_id = item_id.to_i
    end

    def call
      BASKET.delete_if { |item| item.id == @item_id }
    end
  end
end
