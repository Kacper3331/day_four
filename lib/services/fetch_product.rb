module Store
  class FetchProduct
    def call(product_id)
      PRODUCTS.find do |product|
        product.id == product_id.to_i
      end
    end
  end
end
