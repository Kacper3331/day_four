class Basket
  attr_reader :basket

  def initialize(basket=[])
    @basket = basket
  end

  def add_product(products, id, warehouses, quantity)
    find_warehouse_product = find_warehouse(warehouses, id)
    if find_warehouse_product.amount != 0
      add_produt_to_basket(products, id, warehouses, quantity)
      puts "Added to basket: #{find_product(products, id).name} in amount of #{quantity}"
    else
      puts "You can't buy #{find_product(products, id).name}, not enough amount in warehouse"
    end
  end

  def remove_product(products, id, warehouses, quantity)
    remove_product_from_basket(products, id, warehouses, quantity)
    puts "Removed from basket: #{find_product(products, id).name} in amount of #{quantity}"
  end

  def add_produt_to_basket(products, id, warehouses, quantity)
    @basket << find_product(products, id)
    find_warehouse(warehouses, id).amount -= quantity
  end

  def remove_product_from_basket(products, id, warehouses, quantity)
    @basket.delete_if { |basket| basket.id == id }
    find_warehouse(warehouses, id).amount += quantity
  end

  def total_price
    basket.map(&:price).reduce(0, :+)
  end

  def total_price_with_vat
    total_price * 1.23
  end

  private
  def find_product(products, id)
    find_product = products.find { |product| product.id == id }
  end

  def find_warehouse(warehouses, id)
    warehouses.find { |warehouse| warehouse.product_id == id }
  end
end
