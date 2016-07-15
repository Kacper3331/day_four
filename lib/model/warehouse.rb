module Store
  class Warehouse
    attr_reader :product_id, :id
    attr_accessor :amount

    @@id = 0

    def initialize(product_id, amount)
      @id = new_id
      @product_id = product_id
      @amount = amount
    end

    private
    def new_id
      @@id += 1
    end
  end
end
