module Store
  class SubtractionBetweenAmountInWarehouseAndQuantityInBasket
    def initialize(params)
      @item_id = params.fetch("product_id").to_i
      @quantity = params.fetch("quantity").to_i
    end

    def call
      Store::FetchWarehouseItem.new.call(@item_id).amount -= @quantity
    end
  end
end
