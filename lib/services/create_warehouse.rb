module Store
  class CreateWarehouse
    def call(product_id, amount)
      WAREHOUSE << Store::Warehouse.new(product_id, amount)
    end
  end
end
