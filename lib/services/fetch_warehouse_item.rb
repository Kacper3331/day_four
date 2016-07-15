module Store
  class FetchWarehouseItem
    def call(product_id)
      WAREHOUSE.find do |warehouse|
        warehouse.product_id == product_id.to_i
      end
    end
  end
end
