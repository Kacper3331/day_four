class Basket
  attr_reader :products, :warehouses, :selected_products

  def initialize(selected_products=[], products:, warehouses:)
    @selected_products = selected_products
    @products = products
    @warehouses = warehouses
  end

  def add_product(product_id, quantity)
    find_warehouse_product = find_warehouse(product_id)
    if find_warehouse_product.amount != 0
      add_product_to_basket(product_id, quantity)
      "Added to basket: #{find_product(product_id).name} in amount of #{quantity}"
    else
      "You can't buy #{find_product(product_id).name}, not enough amount in warehouse"
    end
  end

  def remove_product(product_id, quantity)
    check_selected_products = selected_products.find { |product| product.id == product_id }
    if !check_selected_products.nil?
      remove_product_from_basket(product_id, quantity)
      "Removed from basket: #{check_selected_products.name} in amount of #{quantity}"
    else
      "Product is not in the basket"
    end
  end

  def total_price
    selected_products.map(&:price).reduce(0, :+)
  end

  def total_price_with_vat
    total_price * 1.23
  end

  private
  def add_product_to_basket(product_id, quantity)
    selected_products << find_product(product_id)
    find_warehouse(product_id).amount -= quantity
  end

  def remove_product_from_basket(product_id, quantity)
    selected_products.delete_if { |product| product.id == product_id }
    find_warehouse(product_id).amount += quantity
  end

  def find_product(product_id)
    products.find { |product| product.id == product_id }
  end

  def find_warehouse(product_id)
    warehouses.find { |warehouse| warehouse.product_id == product_id }
  end
end
