Dir["./lib/**/*.rb"].each{ |file| require file }

module Store
  PRODUCTS = []

  CreateProduct.new.call("Chocolate", 9.99)
  CreateProduct.new.call("Milk Natural", 2.00)
  CreateProduct.new.call("Still Water", 1.68)
  CreateProduct.new.call("Toilet Paper", 8.88)

  WAREHOUSE = []

  CreateWarehouse.new.call(1, 4)
  CreateWarehouse.new.call(2, 2)
  CreateWarehouse.new.call(3, 11)
  CreateWarehouse.new.call(4, 2)

  BASKET = []
end
