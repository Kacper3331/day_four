module Store
  class SumOfAmountInWarehouseAndQuantityInBasket
    def initialize(item_id)
      @item_id = item_id.to_i
    end

    def call
      quantity = Store::FetchItemFromBasket.new.call(@item_id).quantity
      product_id =  Store::FetchItemFromBasket.new.call(@item_id).product_id
      Store::FetchWarehouseItem.new.call(product_id).amount += quantity
    end
  end
end
