module Store
  class FetchWarehouse
    def call(product_id)
      WAREHOUSE.find do |warehouse|
        warehouse.product_id == product_id
      end
    end
  end
end
