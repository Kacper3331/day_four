module Store
  class CreateProduct
    def call(name, price)
      PRODUCTS << Store::Product.new(name, price)
    end
  end
end
