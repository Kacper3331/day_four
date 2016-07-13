module Store
  class Basket
    attr_reader :product_id, :quantity, :id

    @@id = 0

    def initialize(product_id:, quantity:)
      @id = set_id
      @product_id = product_id
      @quantity = quantity
    end

    def fetch_product
      FetchProduct.new.call(product_id)
    end

    def price_with_vat
      product = FetchProduct.new.call(product_id)
      (product.price_netto * 1.23).round(2)
    end

    def total_price
      fetch_product.price_netto * quantity
    end

    def total_price_with_vat
      (total_price * 1.23).round(2)
    end

    private
    def set_id
      @@id += 1
    end
  end
end
