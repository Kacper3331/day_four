module Store
  class Product
    attr_reader :id
    attr_writer :quantity
    attr_accessor :price_netto, :name

    @@id = 0

    def initialize(name, price_netto)
      @id = new_id
      @name = set_name(name)
      @price_netto = set_price(price_netto)
    end

    def update(parameters)
      @name = parameters[:name] if !parameters[:name].nil?
      @price = parameters[:price] if !parameters[:price].nil?
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
