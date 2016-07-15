module Store
  class Warehouse
    attr_reader :product_id, :id
    attr_accessor :amount

    @@id = 0

    def initialize(product_id, amount)
      @id = new_id
      @product_id = product_id
      @amount = set_amount(amount)
    end

    private
    def new_id
      @@id += 1
    end

    def set_amount(amount)
      raise ArgumentError unless amount.is_a?(Numeric)
      raise ArgumentError if amount < 0
      amount
    end
  end
end
