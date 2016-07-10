require_relative "./product"
require_relative "./basket"
require_relative "./warehouse"

product_1 = Product.new(name: "Chocolate", price: 9.99)
product_2 = Product.new(name: "Milk Natural", price: 2.00)
product_3 = Product.new(name: "Still Water", price: 1.68)
product_4 = Product.new(name: "Toilet Paper", price: 8.88)

products = [product_1, product_2, product_3, product_4]

warehouse_1 = Warehouse.new(product_id: 1, amount: 4)
warehouse_2 = Warehouse.new(product_id: 2, amount: 4)
warehouse_3 = Warehouse.new(product_id: 3, amount: 11)
warehouse_4 = Warehouse.new(product_id: 4, amount: 2)

warehouses = [warehouse_1, warehouse_2, warehouse_3, warehouse_4]

product_1.update(price: 8.85)
warehouse_1.update(amount: 1)

puts "List of products: "
puts "======================================================================"
puts "#{product_1.show_product}"
puts "#{product_2.show_product}"
puts "#{product_3.show_product}"
puts "#{product_4.show_product}"
puts

puts "Today on discount: "
puts "======================================================================"
puts "#{product_1.show_discount_product(2)}"
puts "======================================================================"
puts

puts "Your shopping"
puts "======================================================================"

basket = Basket.new(products: products, warehouses: warehouses)
puts "#{basket.add_product(1, 1)}"
puts "#{basket.add_product(2, 1)}"
puts "#{basket.add_product(2, 1)}"
puts "#{basket.remove_product(1, 1)}"

puts "======================================================================"
puts

puts "Total price: #{basket.total_price} zl"
puts "Total price with VAT: #{basket.total_price_with_vat.round(2)} zl"
