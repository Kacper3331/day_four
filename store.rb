require "bundler/setup"
require "sinatra/base"
require "pry"

Dir["./lib/**/*.rb"].each{ |file| require file }

module Store
  PRODUCTS = []

  CreateProduct.new.call("Chocolate", 9.99)
  CreateProduct.new.call("Milk Natural", 2.00)
  CreateProduct.new.call("Still Water", 1.68)
  CreateProduct.new.call("Toilet Paper", 8.88)

  WAREHOUSE = []

  CreateWarehouse.new.call(1, 4)
  CreateWarehouse.new.call(2, 2)
  CreateWarehouse.new.call(3, 11)
  CreateWarehouse.new.call(4, 2)

  BASKET = []

  class App < Sinatra::Base
    configure :test do
      set :dump_errors, false
    end

    get "/" do
      products = FetchProducts.new.call
      slim :"products/index", locals: { products: products }
    end

    get "/products/:id" do |product_id|
      product = FetchProduct.new.call(product_id)
      item_in_warehouse = FetchWarehouseItem.new.call(product_id)

      halt 404 unless product

      slim :"products/show", locals: { product: product, item_in_warehouse: item_in_warehouse }
    end

    post "/basket" do
      SubtractionBetweenAmountInWarehouseAndQuantityInBasket.new(params).call
      AddProductToBasket.new(params).call

      redirect "/"
    end

    get "/basket" do
      products_in_basket = FetchItemsFromBasket.new.call
      summary = TotalPriceForProductsInBasket.new.call

      if !products_in_basket.empty?
        slim :"basket/show", locals: { basket: products_in_basket, summary: summary }
      else
        slim :"basket/empty_basket"
      end
    end

    delete "/basket/:id/delete" do
      SumOfAmountInWarehouseAndQuantityInBasket.new(params[:id]).call
      RemoveProductFromBasket.new(params[:id]).call

      redirect "/"
    end
  end
end
