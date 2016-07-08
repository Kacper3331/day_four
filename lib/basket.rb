class Basket
  attr_reader :basket

  def initialize(basket=[])
    @basket = basket
  end

  def add_product(products, product_id, warehouses, quantity)
    find_warehouse_product = find_warehouse(warehouses, product_id)
    if find_warehouse_product.amount != 0
      add_product_to_basket(products, product_id, warehouses, quantity)
      "Added to basket: #{find_product(products, product_id).name} in amount of #{quantity}"
    else
      "You can't buy #{find_product(products, product_id).name}, not enough amount in warehouse"
    end
  end

  def remove_product(product_id, warehouses, quantity)
    check_basket = basket.find { |basket| basket.id == product_id }
    if check_basket != nil
      remove_product_from_basket(product_id, warehouses, quantity)
      "Removed from basket: #{check_basket.name} in amount of #{quantity}"
    else
      "Product is not in the basket"
    end
  end

  def add_product_to_basket(products, product_id, warehouses, quantity)
    basket << find_product(products, product_id)
    find_warehouse(warehouses, product_id).amount -= quantity
  end

  def remove_product_from_basket(product_id, warehouses, quantity)
    basket.delete_if { |basket| basket.id == product_id }
    find_warehouse(warehouses, product_id).amount += quantity
  end

  def total_price
    basket.map(&:price).reduce(0, :+)
  end

  def total_price_with_vat
    total_price * 1.23
  end

  private
  def find_product(products, product_id)
    products.find { |product| product.id == product_id }
  end

  def find_warehouse(warehouses, product_id)
    warehouses.find { |warehouse| warehouse.product_id == product_id }
  end
end
