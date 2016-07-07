class Product
  attr_reader :name, :id
  attr_writer :quantity
  attr_accessor :price

  @@id = 0

  def initialize(name:, price:)
    @id = new_id
    @name = name
    @price = set_price(price)
  end

  def self.show_products(products)
    puts "List of products: "
    puts "======================================================================"
    products.each do |product|
      puts "ID: #{product.id} \t|\t NAME: #{product.name} \t|\t PRICE: #{product.price}"
    end
  end

  def show_discount_product(amount)
    discount(@price, amount)
    puts "======================================================================"
    puts "\tNAME: #{@name} \t|\t SPECIAL PRICE:  #{@price} zl"
    puts "======================================================================"
    puts
  end

  def discount(price, amount)
    price -= amount
  end

  def price_with_vat
    price * 1.23
  end

  private
  def new_id
    @@id += 1
  end

  def set_price(price)
    raise ArgumentError unless price.is_a?(Numeric)
    raise ArgumentError if price <= 0
    price
  end
end
