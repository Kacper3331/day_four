class Basket
  attr_reader :basket

  def initialize(basket=[])
    @basket = basket
  end

  def add(products, id, warehouses, quantity)
    find_warehouse_product = warehouses.find { |warehouse| warehouse.product_id == id }
    if find_warehouse_product.amount != 0
      @basket << find_product(products, id)
      find_warehouse_product.amount -= quantity
      puts "Added to basket: #{find_product(products, id).name} in amount of #{quantity}"
    else
      puts "You can't buy #{find_product(products, id).name}, not enough amount in warehouse"
    end
  end

  def remove(products, id, warehouses, quantity)
    find_warehouse_product = warehouses.find { |warehouse| warehouse.product_id == id }
    @basket.delete_if { |basket| basket.id == id }
    find_warehouse_product.amount += quantity
    puts "Removed from basket: #{find_product(products, id).name} in amount of #{quantity}"
  end

  def sum
    sum = @basket.map { |basket| basket.price }.reduce(0, :+)
    puts "Sum: #{sum.round(2)} zl"
  end

  def sum_with_vat
    sum = @basket.map { |basket| basket.price }.reduce(0, :+)
    sum_vat = sum * 1.23
    puts "Sum VAT: #{sum_vat}"
  end

  private
  def find_product(products, id)
    find_product = products.find { |product| product.id == id }
  end
end
