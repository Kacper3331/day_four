module Store
  class Product
    attr_reader :id
    attr_writer :quantity
    attr_accessor :price, :name

    @@id = 0

    def initialize(name, price)
      @id = new_id
      @name = set_name(name)
      @price = set_price(price)
    end

    def show_product
      "ID: #{id} \t|\t NAME: #{name} \t|\t PRICE: #{price}"
    end

    def show_discount_product(amount)
      "\tNAME: #{name} \t|\t SPECIAL PRICE: #{discount(price, amount)} zl"
    end

    def discount(price, amount)
      price -= amount
    end

    def update(parameters)
      @name = parameters[:name] if !parameters[:name].nil?
      @price = parameters[:price] if !parameters[:price].nil?
    end

    def price_with_vat
      price * 1.23
    end

    private
    def new_id
      @@id += 1
    end

    def set_name(name)
      raise ArgumentError unless name.is_a?(String)
      name
    end

    def set_price(price)
      raise ArgumentError unless price.is_a?(Numeric)
      raise ArgumentError if price <= 0
      price
    end
  end
end
