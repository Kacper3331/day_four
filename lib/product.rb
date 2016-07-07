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
    products.each do |x|
      puts "ID: #{x.id} \t|\t NAME: #{x.name} \t|\t PRICE: #{x.price}"
    end
  end

  def self.discount(products, id, amount)
    find_product = products.find{ |x| x.id == id }
    find_product.price -= amount
    puts "======================================================================"
    puts "\tNAME: #{find_product.name} \t|\t SPECIAL PRICE:  #{find_product.price} zl"
    puts "======================================================================"
    puts
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
